<?php
header('Content-Type: application/json');

// Get method and path
$method = $_SERVER['REQUEST_METHOD'];
$path = rtrim(parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH), '/');

if (str_contains($path, '/api')){
    $path = substr($path, strpos($path, '/api'));
}

$path = rtrim($path, '/') ? : '/';

//Decode JSON body if POST or PUT
$data = [];
if(in_array($method, ['POST', 'PUT']) && strpos($_SERVER['CONTENT_TYPE'] ?? '', 'application/json') !== false){
    $data = json_decode(file_get_contents('php://input'), true) ?? [];
}

// Shortcut to container
$container = $GLOBALS['container'] ?? [];

// Helper: send JSON response with status code
function respond($payload, $status = 200){
    http_response_code($status);
    echo json_encode($payload);
    exit;
}

//Define routes with dynamic controller resolution
// add // Item
// format example: ['GET', '#^/api/item/?$#', 'someController@someFunction'],
$routes = [
    // child
    ['GET', '#^/api/children/?$#', 'childController@getAllChilds'],
    ['POST', '#^/api/child/?$#', 'childController@createChild'],
    ['PUT', '#^/api/child/(\d+)?$#', 'childController@updateChild'],
    ['DELETE', "#^/api/child/(\d+)?$#", 'childController@deleteChild'],
    ['GET', "#^/api/children/archive/?$#", 'childController@archiveChildren'],
    ['GET', "#^/api/children/all/(\d+)?$#", 'childController@getAllChildByDonorId'],
    ['GET', "#^/api/child/allUnassociated/?$#", 'childController@getAllUnAssociatedChild'],
    ['PUT', '#^/api/child/associateDonor/(\d+)?$#', 'childController@associateDonorByChildID'],
    ['PUT', '#^/api/child/dissociateDonor/(\d+)?$#', 'childController@dissociateDonorByChildID'],
    // ['GET', '#^/api/kare/child/(\d+)?$#', 'childController@getChildByID'],

    //donors
    ['GET', '#^/api/donor/?$#', 'donorController@getAllDonors'],
    ['POST', '#^/api/donor/?$#', 'donorController@createDonor'],
    ['PUT', '#^/api/donor/(\d+)?$#', 'donorController@updateDonor'],
    ['GET', "#^/api/donor/archive/?$#", 'donorController@archiveDonors'],
    ['GET', "#^/api/donor/childAssociated/?$#", 'donorController@getDonorsChildAssociated'],
    ['GET', '#^/api/donor/allActiveDonors/?$#', "donorController@getAllActiveDonors"],

    //contact
    ['GET', '#^/api/contacts/(\d+)?$#', 'donorContactController@getAllContactsByID'],
    ['POST', '#^/api/contact/?$#', 'donorContactController@createDonorContact'],
    ['DELETE', '#^/api/contact/(\d+)/?$#', 'donorContactController@deleteDonorContact'],


    // lookup tables

    ["GET", "#^/api/lookups/gift_card_types/?$#", "lookupController@getGiftCardTypes"],
    ["GET", "#^/api/lookups/race/?$#", "lookupController@getRace"],


    // clothing 
    ["GET", "#^/api/types/?$#", "clothingController@getAllClothingTypes"], 
    ["GET", "#^/api/sizes/(\d+)?$#", "clothingController@getAllSizesByClothing"],


    // Employee
    ["GET", "#^/api/employees/(\d+)/?$#", "employeeController@getEmployeeById"],
    ["GET", "#^/api/employees/?$#", "employeeController@getAllActiveEmployees"],
     ['GET', "#^/api/employees/childAssociated/?$#", 'employeeController@getWorkersChildAssociated'],
    
     // lottery
    ['GET', "#^/api/lottery/?$#", "lotteryController@getAllLottery"],
    ["PUT", '#^/api/lottery/sold/(\d+)?$#', "lotteryController@updateSold"],
    ["PUT", '#^/api/lottery/(\d+)?$#', "lotteryController@updateLottery"],
    ["PUT", '#^/api/lottery/delete/(\d+)?$#', "lotteryController@deleteLottery"],
    ['PUT', '#^/api/lottery/archive/?$#', "lotteryController@archiveLottery"],



    // Reporting
    ["GET", "#^/api/reporting/childrenByDonorID/(\d+)?$#", "reportingController@createAllChildByDonor"],
    ['GET', '#^/api/reporting/childByChildID/(\d+)?$#', 'reportingController@createChildByID'],
    ['GET', '#^/api/reporting/children/workerID/(\d+)?$#', "reportingController@createAllChildByWoker"],
    ['GET', '#^/api/reporting/children/giftCard/?$#', "reportingController@createGiftCardTypes"],
    ['GET', '#^/api/reporting/children/lottery/?$#', "reportingController@createLottery"],
    ['GET', '#^/api/reporting/children/giftPickUp/?$#', "reportingController@createGiftPickUp"],
    ['GET', '#^/api/reporting/donors/(\d+)?$#', "reportingController@createDonors"],
    ['GET', '#^/api/reporting/toyDrive/?$#', "reportingController@createToyDrDonors"],
    ['GET', '#^/api/reporting/stockingsDonors/?$#', "reportingController@createStockingsDonors"],
    ['GET', '#^/api/reporting/activeDonors/?$#', "reportingController@createActiveDonors"],


    



    
];

//Match route
$matched = false;
foreach ($routes as [$routeMethod, $routePattern, $handler]){
    if ($method === $routeMethod && preg_match($routePattern, $path, $matches)){
        $matched = true;
        try{
            [$controllerKey, $methodName] = explode('@', $handler);

            //Check controller exists in container
            if(!isset($container[$controllerKey])){
                respond(['error' => "Controller $controllerKey not found"], 500);
            }

            $controller = $container[$controllerKey]();

            // Remove full match from $matches
            array_shift($matches);

            // If request body exists and method expects it, prepend it
            $params = $matches;
            if(!empty($data)){
                $params[] = $data;
            }

            // Call controller method dynamically
            if (!method_exists($controller, $methodName)){
                respond(['error' => "Method $methodName not found in $controllerKey"], 500);
            }

            call_user_func_array([$controller, $methodName], $params);
        } catch(\Exception $e){
            respond(['error' => 'Internal Server Error: ' . $e->getMessage()], 500);
        }
        break;
    }
}

// No route matched
if(!$matched) {
    respond(['error' => 'Endpoint Not Found'], 404);
}