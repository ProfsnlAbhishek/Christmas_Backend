<?php

namespace Christmas\Controller;

use Christmas\Service\DonorService;
use Christmas\Entity\Donor;
use Exception;

class DonorController extends BaseController
{
    private DonorService $donorService;

    public function __construct(DonorService $donorService)
    {
        $this->donorService = $donorService;
    }

    public function getAllDonors(): void {
        try{
            $donors = $this->donorService->findAllDonors();
            $this->sendJson($donors);
        }catch (Exception $e){
            $this->sendError($e->getMessage(), 400);
        }
    }

    
    public function getDonorsChildAssociated(): void{
        try{
            $donors = $this->donorService->getDonorsChildAssociated();
            $this->sendJson($donors);
        }catch(Exception $e){
            $this->sendError($e->getMessage(), 400);
        }
    }

    public function createDonor(array $data): void{
        try{
            $created = $this->donorService->createDonor($data);
            $this->sendJson($created);
        
        }catch (Exception $e){
            $this->sendError($e->getMessage(), 400);
        }

    }

    public function updateDonor (int $donorID, array $data): void {
        try{
            $donor = new Donor($data);
            $donor->donorID = $donorID;
            $updated = $this->donorService->updateDonor($donor);
            $this->sendJson($updated, 201);
        } catch(Exception $e){
            $this->sendError($e->getMessage(), 400);
        }
    }



    

public function archiveDonors(): void
{
    $year = date('Y') - 1;
    $directory = __DIR__ . "/../../files";
    $filepath = $directory . "/donors_archive_$year.csv";
    try {

        // Define folder and file path

        // Automatically create the directory if missing
        if (!is_dir($directory)) {
            mkdir($directory, 0755, true);  // recursive creation
        }

        // Perform CSV creation
        $this->donorService->archiveDonors($filepath);

    } catch (Exception $e) {
        $this->sendError($e->getMessage(), 400);
    }



// clearing the data fields
    try{
       if(file_exists($filepath)){

        $this->donorService->clearArchivedData();
          $this->sendJson([
            "message" => "CSV archived successfully",
            "path" => $filepath
        ]);

       }
    }catch(Exception $e){
        $this->sendError($e->getMessage(), 400);
    }
}

public function getAllActiveDonors(): void 
{
    try{
        $donors = $this->donorService->getAllActiveDonors();
        $this->sendJson($donors, 200);
    }catch(Exception $e){
        $this->sendError($e->getMessage(), 400);
    }
}

}