<?php

namespace Christmas\Repository;
use Christmas\Entity\DonorContact;
use PDO;

class DonorContactRepository extends BaseRepository{
    protected string $table = "donor_contacts";
    protected string $primaryKey = "contactID";



    public function findById(int $id)
    {
        $row = parent::findById($id);
        return $row ? new DonorContact($row) : null;
    }


    public function insert(DonorContact $contact): DonorContact{
        $stmt = $this->db->prepare(
            "
            INSERT INTO donor_contacts
            (donorID, contact_name, contact_phone, email, alternate_phone, fax) 
            VALUES
            (:donorID, :contact_name, :contact_phone, :email, :alternate_phone, :fax)
            "
        );

        $stmt->execute([
            "donorID" => $contact->donorID,
            "contact_name" => $contact->contact_name,
            "contact_phone" => $contact->contact_phone,
            "email"=> $contact->email,
            "alternate_phone" => $contact->alternate_phone,
            "fax" => $contact->fax,
        ]);

        $contact->contactID = $this->db->lastInsertId();
        return $contact;
    }


    public function getAllContactById(int $id): array 
    {
        $stmt = $this->db->prepare("
        SELECT * FROM {$this->table} WHERE donorID = :id");

        $stmt->execute(["id" =>$id]);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $rows;
    }


   


}