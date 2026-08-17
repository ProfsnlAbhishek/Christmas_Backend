<?php
require_once __DIR__ . '/../vendor/autoload.php';

//add name of program in beginning
use Christmas\Database\Database;

// Enable CORS for frontend Development (comment out when in production)
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Headers: Content-Type, Authorization");

// Handle preflight OPTIONS requests
if($_SERVER['REQUEST_METHOD'] === 'OPTIONS'){
    http_response_code(200);
    exit;
}

try {
    $pdo = Database::getConnection();
}catch (PDOException $e){
    http_response_code(500);
    echo json_encode(['error' => 'Database connection failed.']);
    exit;
}


// --- Lazy-loading container ---
$container=[];

// Repositories  ($container['someRepo'] = fn() => new {ProgName}\Repository\SomeRepository($pdo);)
$container["childRepo"] = fn() => new Christmas\Repository\ChildRepository($pdo);
$container['empRepo'] = fn() => new Christmas\Repository\EmployeeRepository($pdo);
$container["donorRepo"] = fn() => new Christmas\Repository\DonorRepository($pdo);
$container["clothingRepo"] = fn() => new Christmas\Repository\ClothingRepository($pdo);
$container["lotteryRepo"] = fn() => new Christmas\Repository\LotteryRepository($pdo);
$container["donorContactRepo"] = fn() => new Christmas\Repository\DonorContactRepository($pdo);
$container["reportingRepo"] = fn() => new Christmas\Repository\ReportingRepository($pdo);







// Services ($container['someService] = fn() => new {ProgName}\Service\SomeService($pdo, $container['someRepo']());)
$container['childService'] = fn() => new Christmas\Service\ChildService($pdo, $container['childRepo']());
$container['donorService'] = fn() => new Christmas\Service\DonorService($pdo, $container['donorRepo']());
$container['clothingService'] = fn() => new Christmas\Service\ClothingService($pdo, $container['clothingRepo']());
$container['lookupService'] = fn() => new Christmas\Service\LookupService($pdo);
$container['lotteryService'] = fn() => new Christmas\Service\LotteryService($pdo, $container["lotteryRepo"]());
$container['employeeService'] = fn() => new Christmas\Service\EmployeeService($pdo, $container['empRepo']());
$container['donorContactService'] = fn() => new Christmas\Service\DonorContactService($pdo, $container['donorContactRepo']());
$container['reportingService'] = fn() => new Christmas\Service\ReportingService($pdo, $container['reportingRepo']());






// Controllers ($container['someController] = fn() => new {ProgName}\Controller\SomeController($container['someService']());)

$container['childController'] = fn() => new Christmas\Controller\ChildController($container['childService']());
$container['donorController'] = fn() => new Christmas\Controller\DonorController($container['donorService']());
$container['clothingController'] = fn() => new Christmas\Controller\ClothingController($container['clothingService']());
$container["lookupController"] = fn() => new Christmas\Controller\LookupController($container["lookupService"]());
$container["lotteryController"] = fn() => new Christmas\Controller\LotteryController($container["lotteryService"]());
$container['employeeController'] = fn() => new Christmas\Controller\EmployeeController($container['employeeService']());
$container['donorContactController'] = fn() => new Christmas\Controller\DonorContactController($container['donorContactService']());
$container['reportingController'] = fn() => new Christmas\Controller\ReportingController($container['reportingService']());


// Router
$GLOBALS['container'] = &$container;
$container['router'] = fn() => require __DIR__ . '/router.php';

//Run router safely
try {
    $container['router']();
}catch(\Exception $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Internal server erro: ' . $e->getMessage()]);
}