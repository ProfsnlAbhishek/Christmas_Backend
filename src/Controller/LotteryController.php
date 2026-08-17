<?php

namespace Christmas\Controller;

use Christmas\Service\LotteryService;
use Christmas\Entity\Lottery;

use Exception;

class LotteryController extends BaseController{
    private LotteryService $lotteryService;

    public function __construct(LotteryService $lotteryService)
    {
       $this->lotteryService = $lotteryService;
    }

    public function getAllLottery(): void{
        try{
            $lottery = $this->lotteryService->getAllLottery();
            $this->sendJson($lottery);
        }catch(Exception $e){
            $this->sendError($e->getMessage(), 400);
        }
    }


    public function updateSold(int $packetID, array $data): void{
        try{
            $lottery = new Lottery($data);
            $lottery->packetID = $packetID;
            $updated = $this->lotteryService->updateSold($lottery);
            $this->sendJson($updated, 201);

        }catch(Exception $e){
            $this->sendError($e->getMessage(), 400);
        }
    }

    public function updateLottery(int $ticketID, array $data): void{
        try{
            $lottery = new Lottery($data);
            // $lottery->ticketID = strval($ticketID);
            $updated = $this->lotteryService->updateLottery($lottery);
            $this->sendJson($updated, 201);

        }catch(Exception $e){
            $this->sendError($e->getMessage(), 400);
        }
    }

    public function deleteLottery(int $ticketID, array $data): void{
        try{
            $lottery = new Lottery($data);
            // $lottery->ticketID = $ticketID;
            $updated = $this->lotteryService->deleteLottery($lottery);
            $this->sendJson($updated, 201);

        }catch(Exception $e){
            $this->sendError($e->getMessage(), 400);
        }
    }

    public function archiveLottery(): void{
        try{
            $this->lotteryService->archiveLottery();
            $this->sendJson(['success' => true]);
        
        }catch(Exception $e){
            $this->sendError($e->getMessage(), 400);
        }
    }

}