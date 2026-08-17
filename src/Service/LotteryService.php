<?php

namespace Christmas\Service;
use PDO;
use Exception;
use Christmas\Entity\Lottery;
use Christmas\Repository\LotteryRepository;


class LotteryService extends BaseService {
    private LotteryRepository $lotteryRepo;

    public function __construct(PDO $db, LotteryRepository $lotteryRepo)
    {
         parent::__construct($db);
         $this->lotteryRepo = $lotteryRepo;



    }


    public function getAllLottery(): array{
        return array_map(fn($row)=>new Lottery($row), $this->lotteryRepo->findAll());

    }

    public function updateSold(Lottery $lottery): Lottery{
        if($lottery->ticketID < 0){
            throw new Exception("Ticket ID is required for update");
    
        }
        return $this->runInTransaction(function () use ($lottery){
            $updated = $this->lotteryRepo->updateSold($lottery);
            if(!$updated){
                throw new Exception("Lottery Update Failed");

            }
            return $lottery;
        });
    }

    public function updateLottery(Lottery $lottery): Lottery{
        if(!$lottery->ticketID){
            throw new Exception("Ticket ID is required for update");
    
        }
        return $this->runInTransaction(function () use ($lottery){
            $updated = $this->lotteryRepo->update($lottery);
            if(!$updated){
                throw new Exception("Lottery Update Failed");

            }
            return $lottery;
        });
    }

    public function deleteLottery(Lottery $lottery): Lottery{
        $this->runInTransaction(function () use ($lottery){
            $deleted = $this->lotteryRepo->deleteSP($lottery);
            if(!$deleted){
                throw new Exception("Lottery Delete Failed");
            }
        });

        return $lottery;
    }

    public function archiveLottery(): void {
        $this->runInTransaction(function (){
            $archive = $this->lotteryRepo->archiveLottery();
            if(!$archive){
                throw new Exception("Could not archive Lottery");
            }
        });
    }

    




}