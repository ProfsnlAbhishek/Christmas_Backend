<?php

namespace Christmas\Repository;

use Christmas\Entity\Donor;
use Christmas\Entity\DonorContact;
use PDO;

class DonorRepository extends BaseRepository
{
    protected string $table = "donors";
    protected string $primaryKey = "donorID";



    public function findById(int $id)
    {
        $row = parent::findById($id);
        return $row ? new Donor($row) : null;
    }

    public function findAllDonors(): array
    {
        $stmt = $this->db->prepare("
        SELECT * FROM donors WHERE active=1");

        $stmt->execute();

        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return array_map(fn($row) => new Donor($row), $rows);
    }

    public function insert(Donor $donor): Donor
    {
        $stmt = $this->db->prepare(
            "
            INSERT INTO donors
                (donor_name, address1, address2, city, state, zip, pick_date, pick_assigned_to, pick_det, kids_tag, age0_11, age12abv, gift_tag, inf_boy, inf_girl, tod_boy, tod_girl, age6_10b, age6_10g, age11_14b, age11_14g, age15_18b, age15_18g, toy_dr, instruction, active)
                VALUES
                (:donor_name, :address1, :address2, :city, :state, :zip, :pick_date, :pick_assigned_to, :pick_det, :kids_tag, :age0_11, :age12abv, :gift_tag, :inf_boy, :inf_girl, :tod_boy, :tod_girl, :age6_10b, :age6_10g, :age11_14b, :age11_14g, :age15_18b, :age15_18g, :toy_dr, :instruction, :active)
            "
        );

        $stmt->execute([
            "donor_name" => $donor->donor_name,
            "address1" => $donor->address1,
            "address2" => $donor->address2,
            "city" => $donor->city,
            "state" => $donor->state,
            "zip" => $donor->zip,
            "pick_date" => $donor->pick_date,
            "pick_assigned_to" => $donor->pick_assigned_to,
            "pick_det" => $donor->pick_det,
            "kids_tag" => $donor->kids_tag,
            "age0_11" => $donor->age0_11,
            "age12abv" => $donor->age12abv,
            "gift_tag" => $donor->gift_tag,
            "inf_boy" => $donor->inf_boy,
            "inf_girl" => $donor->inf_girl,
            "tod_boy" => $donor->tod_boy,
            "tod_girl" => $donor->tod_girl,
            "age6_10b" => $donor->age6_10b,
            "age6_10g" => $donor->age6_10g,
            "age11_14b" => $donor->age11_14b,
            "age11_14g" => $donor->age11_14g,
            "age15_18b" => $donor->age15_18b,
            "age15_18g" => $donor->age15_18g,
            "toy_dr" => $donor->toy_dr ? 1 : 0,
            "instruction" => $donor->instruction,
            "active" => $donor->active ? 1 : 0,
        ]);

        $donor->donorID = $this->db->lastInsertId();
        return $donor;
    }

    public function update(Donor $donor): bool
    {
        $stmt = $this->db->prepare("
            UPDATE donors SET
                donor_name = :donor_name,
                address1 = :address1,
                address2 = :address2,
                city = :city,
                state = :state, 
                zip = :zip,
                pick_date = :pick_date,
                pick_assigned_to = :pick_assigned_to,
                pick_det = :pick_det,
                kids_tag = :kids_tag, 
                age0_11 = :age0_11,
                age12abv = :age12abv,
                gift_tag = :gift_tag,
                inf_boy = :inf_boy,
                inf_girl = :inf_girl,
                tod_boy = :tod_boy,
                tod_girl = :tod_girl,
                age6_10b = :age6_10b,
                age6_10g = :age6_10g,
                age11_14b = :age11_14b,
                age11_14g = :age11_14g,
                age15_18b = :age15_18b,
                age15_18g = :age15_18g,
                toy_dr = :toy_dr,
                instruction = :instruction,
                active = :active
            WHERE donorID = :donorID
        ");

        $stmt->execute([
            "donorID" => $donor->donorID,
            "donor_name" => $donor->donor_name,
            "address1" => $donor->address1,
            "address2" => $donor->address2,
            "city" => $donor->city,
            "state" => $donor->state,
            "zip" => $donor->zip,
            "pick_date" => $donor->pick_date,
            "pick_assigned_to" => $donor->pick_assigned_to,
            "pick_det" => $donor->pick_det,
            "kids_tag" => $donor->kids_tag,
            "age0_11" => $donor->age0_11,
            "age12abv" => $donor->age12abv,
            "gift_tag" => $donor->gift_tag,
            "inf_boy" => $donor->inf_boy,
            "inf_girl" => $donor->inf_girl,
            "tod_boy" => $donor->tod_boy,
            "tod_girl" => $donor->tod_girl,
            "age6_10b" => $donor->age6_10b,
            "age6_10g" => $donor->age6_10g,
            "age11_14b" => $donor->age11_14b,
            "age11_14g" => $donor->age11_14g,
            "age15_18b" => $donor->age15_18b,
            "age15_18g" => $donor->age15_18g,
            "toy_dr" => $donor->toy_dr ? 1 : 0,
            "instruction" => $donor->instruction,
            "active" => $donor->active ? 1 : 0,
        ]);

        return $stmt->rowCount() > 0;
    }

    public function insertContact(DonorContact $contact): DonorContact
    {
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
            "email" => $contact->email,
            "alternate_phone" => $contact->alternate_phone,
            "fax" => $contact->fax,
        ]);

        $contact->contactID = $this->db->lastInsertId();
        return $contact;
    }

    public function getDonorsChildAssociated(): array{
        $stmt = $this->db->prepare("
            SELECT
                donorID,
                donor_name
            FROM donors
            WHERE donorID IN ( SELECT DISTINCT donorID FROM child);
        ");
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }




    public function inactiveDonor(): bool
    {
        $stmt = $this->db->prepare(
            "
            UPDATE donors
            SET active = 0;
        "

        );

        return $stmt->execute();
    }

    public function getColumnName(): array
    {
        $stmt = $this->db->prepare(
            "
        SELECT COLUMN_NAME 
        FROM INFORMATION_SCHEMA.COLUMNS 
        WHERE TABLE_NAME = 'donors';
        "
        );

        $stmt->execute();
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return array_map(fn($row) => $row["COLUMN_NAME"], $rows);
    }

   public function clearArchivedData(): bool{
    $stmt = $this->db->prepare(
        "
            UPDATE donors
            SET pick_date = '',
                pick_assigned_to = '',
                pick_det = '',
                kids_tag = 0,
                age0_11 = 0,
                age12abv = 0,
                gift_tag = 0,
                inf_boy = 0,
                inf_girl = 0,
                tod_boy = 0,
                tod_girl = 0,
                age6_10b = 0,
                age6_10g = 0,
                age11_14b = 0,
                age11_14g = 0,
                age15_18b = 0,
                age15_18g = 0,
                toy_dr = 0,
                instruction = '';
    ");

    return $stmt->execute();

   }

   public function findAllActiveDonors(): array 
   {
    $stmt = $this->db->prepare("
        SELECT * FROM donors WHERE active = 1
    ");

    $stmt->execute();

    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    return array_map(fn($row) => new Donor($row), $rows);
   }
}
