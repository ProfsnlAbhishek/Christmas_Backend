<?php

namespace Christmas\Repository;

use PDO;

class ReportingRepository
{
    protected PDO $db;

    public function __construct(PDO $db)
    {
        $this->db = $db;
    }


    public function getAllChildByDonor(int $donorID): array
    {

        $stmt = $this->db->prepare(
            "
                SELECT
                    d.donor_name,
                    d.toy_dr,
                    (d.inf_boy + d.inf_girl + d.tod_boy + d.tod_girl + d.age6_10b + d.age6_10g + d.age11_14b + d.age11_14g + d.age15_18b + d.age15_18g) as stockings,
                    c.f_name,
                    c.childID
                FROM donors d
                JOIN child c
                ON d.donorID = c.donorID
                WHERE d.donorID = :donorID
                ORDER BY c.f_name;
            "
        );

        $stmt->execute([
            "donorID" => $donorID
        ]);

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }


    public function getAllChildByAllDonor(): array
    {

        $stmt = $this->db->prepare("
        SELECT
            d.donor_name,
            d.toy_dr,
            (d.inf_boy + d.inf_girl + d.tod_boy + d.tod_girl + d.age6_10b + d.age6_10g + d.age11_14b + d.age11_14g + d.age15_18b + d.age15_18g) as stockings,
            c.f_name,
            c.childID
        FROM donors d
        JOIN child c
        ON d.donorID = c.donorID
        WHERE d.donorID IN (SELECT DISTINCT donorID FROM CHILD)
        ORDER BY d.donor_name, c.f_name;
    
    ");

        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
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



    public function getAllChildsByWorker(int $workerID): array
    {
        $stmt = $this->db->prepare("

            SELECT
            c.childID,
            c.f_name,
            c.l_name,
            CASE
                WHEN c.donorID = 0 THEN ''
                ELSE d.donor_name
            END AS donor_name,
            CONCAT(e.First_Name, ' ', e.Last_Name) AS worker
            FROM child c
            LEFT JOIN donors d
                ON c.donorID = d.donorID
            INNER JOIN employee_data.employee e
                ON c.workerID = e.Employee_Index
            WHERE c.workerID = :workerID
              ORDER BY worker;

        ");

        $stmt->execute([
            "workerID" => $workerID,
        ]);

        return  $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function getAllChildsByAllWorker(): array
    {
        $stmt = $this->db->prepare("

            SELECT
            c.childID,
            c.f_name,
            c.l_name,
            CASE
                WHEN c.donorID = 0 THEN ''
                ELSE d.donor_name
            END AS donor_name,
             CONCAT(e.First_Name, ' ', e.Last_Name) AS worker
            FROM child c
            LEFT JOIN donors d
                ON c.donorID = d.donorID
            INNER JOIN employee_data.employee e
                ON c.workerID = e.Employee_Index
            WHERE c.workerID IN (SELECT DISTINCT workerID from child)
            ORDER BY worker;

        ");

        $stmt->execute();

        return  $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getGiftCard(): array
    {

        $stmt = $this->db->prepare("

    SELECT 
	    c.childID,
        CONCAT(c.f_name, ' ', c.l_name) as child_name,
        CONCAT(e.First_Name, ' ', e.Last_Name) as worker,
        c.gift_card
    FROM child c
    JOIN employee_data.employee e
        ON c.workerID = e.Employee_Index
    WHERE TRIM(c.gift_card) <> ''
    ORDER BY c.gift_card, c.f_name;

    
    ");

        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }


    public function getLottery(): array
    {

        $stmt = $this->db->prepare("

    SELECT * FROM lottery;
    
    ");

        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }


    public function getGiftPickUpRpt(): array
    {
        $stmt = $this->db->prepare("
            SELECT 
                d.donorID,
                d.donor_name,
                LEFT(d.pick_date, 10) AS pick_date,
                RIGHT(d.pick_date, 5) AS pick_time
            FROM donors d
            WHERE d.pick_date IS NOT NULL
            AND d.pick_date <> ''
            ORDER BY d.pick_date, pick_time;
        
        ");

        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getAllDonorsInfoActive(): array
    {
        $stmt = $this->db->prepare("
            SELECT 
               *
            FROM donors d
            WHERE active = 1;
          
        ");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }


    public function getDonorInfoActive(int $donorID): array
    {
        $stmt = $this->db->prepare("
            SELECT 
               *
            FROM donors d
            WHERE donorID = :donorID && active = 1;
          
        ");
        $stmt->execute(["donorID" => $donorID]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getContactOfDonor(int $donorID): array {
        $stmt = $this->db->prepare("
                SELECT 
                    *
                FROM donor_contacts dc
                LEFT JOIN donors d
                    ON dc.donorID = d.donorID
                WHERE d.active = 1;
        
        ");

        $stmt->execute([
            "donorID" => $donorID
        ]);

        return $stmt->fetchAll(PDO::FETCH_ASSOC);

    } 

    public function getAllContactOfAllDonor(): array {
        $stmt = $this->db->prepare("
                SELECT 
                    *
                FROM donor_contacts;
        ");

        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);

    } 


    public function getAllToyDrDonors(): array
    {
        $stmt = $this->db->prepare("
            SELECT
                donor_name
            FROM donors
            WHERE toy_dr = 1;
        
        ");

        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    public function getAllActiveDonors(): array
    {
        $stmt = $this->db->prepare("
            SELECT
                donor_name
            FROM donors
            WHERE active=1;
        
        ");

        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }


    public function getAllStockingsDonor(): array
    {
        $stmt = $this->db->prepare("
            SELECT 
            donor_name
            FROM donors
            WHERE gift_tag > 0 
            OR (inf_boy + inf_girl + tod_boy + tod_girl + 
                age6_10b + age6_10g + 
                age11_14b + age11_14g + 
                age15_18b + age15_18g) > 0;
        
        ");

        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
