<?php 

namespace Christmas\Controller;

use Christmas\Service\ChildService;

use Christmas\Entity\Child;
use Exception;


class ChildController extends BaseController 
{
    private ChildService $childService;

    public function __construct(ChildService $childService)
    {
       $this->childService = $childService;
       
    }
    public function getAllChilds(): void{
        try{
            $childs = $this->childService->getAllChilds();
            $this->sendJson($childs);

        }catch (Exception $e){
            $this->sendError($e->getMessage(), 400);
        }
    }

    public function createChild(array $data) : void
    {
        try{
            $created = $this->childService->createChild($data);
            $this->sendJson($created);
        }catch (Exception $e){
            $this->sendError($e->getMessage(), 400);
        }
    }

    public function updateChild(int $childID, array $data): void
    {
        try{
            $child = new Child($data);
            $child->childID = $childID;
            $updated = $this->childService->updateChild($child);
            $this->sendJson($updated, 201);
            
        }   catch(Exception $e){
            $this->sendError($e->getMessage(), 400);
        }
    }


       public function deleteChild(int $childID): void{
        try{
            $this->childService->deleteChild($childID);
            $this->sendJson(['success'=>true]);
        }catch(Exception $e){
            $this->sendError($e->getMessage(), 400);
        }
    }


    public function archiveChildren(): void {
        $year= date("Y") - 1;
           $directory = __DIR__ . "/../../files";
        $filepath = $directory . "/child_archive_$year.csv";


        try {
            if(!is_dir($directory)){
                mkdir($directory, 0755, true);
            }

            $this->childService->archiveChildren($filepath);
        }catch(Exception $e){
            $this->sendError($e->getMessage(), 400);
        };


        try{
            if(file_exists($filepath)){
                
                $this->childService->deleteChildren();
                   $this->sendJson([
                "message" => "CSV archived successfully",
                "path" => $filepath
            ]);
            }


        }catch(Exception $e){
            $this->sendError($e->getMessage(), 400);
        }




    }



    public function getAllChildByDonorId(int $donorID): void{
        try{
            $childs = $this->childService->getAllChildByDonorID($donorID);
            $this->sendJson($childs);
        }catch(Exception $e){
            $this->sendError($e->getMessage(), 400);
        }
    }
    public function getAllUnAssociatedChild(): void{
        try{
            $childs = $this->childService->getAllUnAssociatedChild();
            $this->sendJson($childs);
        }catch(Exception $e){
            $this->sendError($e->getMessage(), 400);
        }
    }

    public function associateDonorByChildID(int $childID, array $data): void{
        try{
            if($childID != 0){

                   $donorID = $data['donorID'];   // IMPORTANT: same behavior as updateAppeal

        $this->childService->associateDonorByChildID($childID, $donorID);
        $this->sendJson(["success" => true]);
            }
        
        }catch(Exception $e){
            $this->sendError($e->getMessage(), 400);
        }
    }
    public function dissociateDonorByChildID(int $childID): void{
        try{
            if($childID != 0){

               

        $this->childService->dissociateDonorByChildID($childID);
               $this->sendJson(["success" => true]);
            }
        }catch(Exception $e){
            $this->sendError($e->getMessage(), 400);
        }
    }

    public function getChildByID(int $childID): void{
        try{
            if($childID != 0){
                $child = $this->childService->getChildByID($childID);
                $this->sendJson($child);

            }
        }catch(Exception $e){
            $this->sendError($e->getMessage(), 400);
        }
    }







}