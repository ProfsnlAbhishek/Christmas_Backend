<?php 

namespace Christmas\Repository;

use Christmas\Entity\Lottery;

use PDO;

class LotteryRepository extends BaseRepository{

    protected string $table = "lottery";
    protected string $primaryKey = "ticketID";

    public function findById($id){
        $row = parent::findById($id);
        return $row;
    }

    
    public function updateSold(Lottery $lottery): bool{
        $stmt = $this->db->prepare("

        UPDATE lottery SET
            sold_by = :sold_by
        WHERE packetID   = :packetID
        ");

        $stmt->execute([
            "packetID" => $lottery->packetID,
            "sold_by"  => $lottery->sold_by,
        ]);
        return $stmt->rowCount() > 0;
 
    }

    public function update(Lottery $lottery): bool{
        $stmt = $this->db->prepare("

        UPDATE lottery SET
            sold_by = :sold_by,
            purchased_by = :purchased_by
        WHERE ticketID = :ticketID
        ");

        $stmt->execute([
            "ticketID"      => $lottery->ticketID,
            "sold_by"       => $lottery->sold_by,
            "purchased_by"  => $lottery->purchased_by,

        ]);
        return $stmt->rowCount() > 0;
 
    }


     public function deleteSP(Lottery $lottery): bool{
        $stmt = $this->db->prepare("

        UPDATE lottery SET
            sold_by = '',
            purchased_by = ''
        WHERE ticketID = :ticketID
        ");

        $stmt->execute([
            "ticketID" => $lottery->ticketID,
        ]);
        return $stmt->rowCount() > 0;
 
    }

    
public function archiveLottery(): bool {

    $stmt = $this->db->prepare("
        UPDATE lottery
        SET sold_by = '',
            purchased_by = '';
    ");

    return $stmt->execute();
}



   



}