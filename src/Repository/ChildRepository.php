<?php

namespace Christmas\Repository;

use Christmas\Entity\Child;
use PDO;

class ChildRepository extends BaseRepository
{
    protected string $table = "child";
    protected string $primaryKey = "childID";

    public function findById(int $id)
    {

        $row = parent::findById($id);
        return $row;
    }

    public function findAllChilds(): array
    {

        $stmt = $this->db->prepare("SELECT * FROM child");

        $stmt->execute();

        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return array_map(fn($row) => new Child($row), $rows);
    }



    public function insert(Child $child): Child
    {
        $stmt = $this->db->prepare(
            "
        INSERT INTO child
            ( f_name, l_name, sacwisID, age, gender, race, clothing_type, size, shoe_size, gift_card, workerID, donorID, suggestion)
            VALUES
                (:f_name, :l_name, :sacwisID, :age, :gender, :race, :clothing_type, :size, :shoe_size, :gift_card, :workerID, :donorID, :suggestion)    
        "

        );
        $stmt->execute([
            "f_name"       => $child->f_name,
            "l_name"       => $child->l_name,
            "sacwisID"     => $child->sacwisID,
            "age"          => $child->age,
            "gender"       => $child->gender,
            "race"         => $child->race,
            "clothing_type" => $child->clothing_type,
            "size"         => $child->size,
            "shoe_size"    => $child->shoe_size,
            "gift_card"    => $child->gift_card,
            "workerID"     => $child->workerID,
            "donorID"      => $child->donorID,
            "suggestion"   => $child->suggestion,
        ]);

        $child->childID = $this->db->lastInsertId();
        return $child;
    }

    public function update(Child $child): bool
    {
        $stmt = $this->db->prepare("
        UPDATE child SET
            f_name = :f_name,
            l_name = :l_name,
            sacwisID = :sacwisID,
            age = :age,
            gender = :gender,
            race = :race,
            clothing_type = :clothing_type,
            size = :size,
            shoe_size = :shoe_size,
            gift_card = :gift_card,
            workerID  = :workerID,
            donorID = :donorID,
            suggestion = :suggestion
        WHERE childID = :childID
        ");

        $stmt->execute([
            "childID"      => $child->childID,
            "f_name"       => $child->f_name,
            "l_name"       => $child->l_name,
            "sacwisID"     => $child->sacwisID,
            "age"          => $child->age,
            "gender"       => $child->gender,
            "race"         => $child->race,
            "clothing_type" => $child->clothing_type,
            "size"         => $child->size,
            "shoe_size"    => $child->shoe_size,
            "gift_card"    => $child->gift_card,
            "workerID"     => $child->workerID,
            "donorID"      => $child->donorID,
            "suggestion"   => $child->suggestion,

        ]);

        return $stmt->rowCount() > 0;
    }


    public function getColumnName(): array
    {
        $stmt = $this->db->prepare(
            "
        SELECT COLUMN_NAME 
        FROM INFORMATION_SCHEMA.COLUMNS 
        WHERE TABLE_NAME = 'child';
        "
        );

        $stmt->execute();
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return array_map(fn($row) => $row["COLUMN_NAME"], $rows);
    }


    public function deleteChildren(): bool
    {
        $stmt = $this->db->prepare("
            DELETE From child;
        
        ");
        return $stmt->execute();
    }



    public function getAllChildByDonorID(int $donorID): array
    {
        $stmt = $this->db->prepare("
        SELECT childID, f_name, l_name
        FROM child
        WHERE donorID = :donorID
    ");

        $stmt->execute([
            "donorID" => $donorID,
        ]);

        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $rows;
    }


    public function getAllUnAssociatedChild(): array
    {
        $stmt = $this->db->prepare("
        SELECT childID, f_name, l_name 
        FROM child
        WHERE donorID = 0;
    ");

        $stmt->execute();
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $rows;
    }







    public function associateDonorByChildID(int $childID, int $donorID): bool
    {
        $stmt = $this->db->prepare("
        UPDATE child SET
            donorID = :donorID
            WHERE childID = :childID;
        ");

        $stmt->execute([
            "childID"      => $childID,
            "donorID"      => $donorID,
        ]);

        return $stmt->rowCount() > 0;
    }

    public function dissociateDonorByChildID(int $childID): bool
    {
        $stmt = $this->db->prepare("
        UPDATE child SET
            donorID = 0
            WHERE childID = :childID;
        ");

        $stmt->execute([
            "childID"      => $childID,
        ]);

        return $stmt->rowCount() > 0;
    }


        public function getChildByID(int $childID): array
{
    $stmt = $this->db->prepare("
        SELECT
            c.childID,
            c.f_name,
            c.l_name,
            d.donor_name,
            CONCAT(e.First_Name, ' ', e.Last_Name) AS worker
        FROM child c
        JOIN donors d 
            ON c.donorID = d.donorID
        JOIN employee_data.employee e
            ON c.workerID = e.Employee_Index
        WHERE c.childID = :childID
    ");

    $stmt->execute([
        "childID" => $childID
    ]);

    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$row) {
        return [];
    }

    return $row;
}




}
