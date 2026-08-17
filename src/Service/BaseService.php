<?php 

//add program name in front of Service
namespace Christmas\Service;

use PDO;
use Exception;

abstract class BaseService 
{
    protected PDO $db;

    public function __construct(PDO $db){
        $this->db = $db;
    }

    protected function runInTransaction(callable $callback)
    {
        $ownTransaction = false;

        try {
            if(!$this->db->inTransaction()){
                $this->db->beginTransaction();
                $ownTransaction = true;
            }
            $result = $callback();

            if($ownTransaction){
                $this->db->commit();
            }

            return $result;
        }catch (Exception $e){
            if($ownTransaction && $this->db->inTransaction()){
                $this->db->rollback();
            }
            throw $e;
        }
    }
}