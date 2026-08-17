<?php

namespace Christmas\Controller;

use Christmas\Service\ReportingService;
use Exception;

class ReportingController extends BaseController
{
    private ReportingService $reportingService;

    public function __construct(ReportingService $reportingService){
        $this->reportingService = $reportingService;
    }

    


    public function createAllChildByDonor(int $donorID): void{
        try{
            $this->reportingService->createAllChildByDonor($donorID);
        }catch (Exception $e){
            $this->handleException($e);
        }
    }

    public function createChildByID(int $childID): void{
        try{
            $this->reportingService->createChildByID($childID);

        }catch(Exception $e){
            $this->handleException($e);
        }
    }

    public function createAllChildByWoker(int $worker): void {
        try{
            $this->reportingService->createAllChildByWoker($worker);
        }catch(Exception $e){
            $this->handleException($e);
        }
    }

    public function createGiftCardTypes(): void{
        try{
            $this->reportingService->createGiftCardTypes();
        }catch(Exception $e){
            $this->handleException($e);
        }
    }

  
    public function createLottery(): void{
        try{
            $this->reportingService->createLottery();
        }catch(Exception $e){
            $this->handleException($e);
        }
    }


    public function createGiftPickUp(): void{
        try{
            $this->reportingService->createGiftPickUp();

        }catch(Exception $e){
            $this->handleException($e);
        }
    }


    public function createDonors(int $donorID): void {
        try{
            $this->reportingService->createDonorInformation($donorID);

        }catch(Exception $e){
            $this->handleException($e);
        }
    }

    public function createToyDrDonors(): void{
        try{
            $this->reportingService->createToyDrDonors();
        }catch(Exception $e){
            $this->handleException($e);
        }
    }
    public function createStockingsDonors(): void{
        try{
            $this->reportingService->createStockingsDonors();
        }catch(Exception $e){
            $this->handleException($e);
        }
    }

    public function createActiveDonors(): void{
        try{
            $this->reportingService->createActiveDonors();
        }catch(Exception $e){
            $this->handleException($e);
        }
    }
  

}