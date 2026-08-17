<?php

namespace Christmas\Repository;

use PDO;

class ClothingRepository extends BaseRepository
{
    protected string $table = "clothing_types";
    protected string $primaryKey = "typeID";

    public function findById(int $id){
        $row = parent::findById($id);
        return $row;
    }

    public function getSizeByClothing(int $typeID): array
    {
        $stmt = $this->db->prepare(
            "SELECT size FROM clothing_sizes WHERE typeID = :id ORDER BY size
            "
        );
        $stmt->execute(["id"=>$typeID]);
        return $stmt->fetchAll(PDO::FETCH_COLUMN);


    }


}