<?php

namespace Christmas\Service;

use PDO;
use Exception;
use Christmas\Entity\Donor;
use Christmas\Repository\DonorRepository;

class DonorService extends BaseService
{
    private DonorRepository $donorRepo;

    public function __construct(
        PDO $db,
        DonorRepository $donorRepo,

    ) {
        parent::__construct($db);
        $this->donorRepo = $donorRepo;
    }

    public function findAllDonors(): array
    {
        return array_map(fn($row) => new Donor($row), $this->donorRepo->findAll());
    }

    public function getDonorsChildAssociated(): array{
        $rows = $this->donorRepo->getDonorsChildAssociated();
        return array_map(fn($row) => $row, $rows);
    }

    public function createDonor(array $data): Donor
    {

        $donor = new Donor($data);
        return $this->runInTransaction((function () use ($donor) {
            $donor  = $this->donorRepo->insert($donor);

            if (!$donor->donorID) {
                throw new Exception("Donor creation failed");
            }
            return $donor;
        }));
    }

    public function updateDonor(Donor $donor): Donor
    {
        if (!$donor->donorID) {
            throw new Exception("Donor ID is required to update");
        }

        return $this->runInTransaction(function () use ($donor) {
            $updated = $this->donorRepo->update($donor);
            if (!$updated) {
                throw new Exception("Donor updated failed");
            }
            return $donor;
        });
    }


    public function archiveDonors(string $filepath)
    {

        $this->runInTransaction(function () {
            $inactivate = $this->donorRepo->inactiveDonor();
            if (!$inactivate) {
                throw new Exception("All Donors could not be made inactive");
            }
        });

        $columns = $this->donorRepo->getColumnName();
        $donors  = $this->donorRepo->findAll();

        // Try to open file
        $file = fopen($filepath, 'w');

        if (!$file) {
            throw new Exception("Unable to write file: $filepath");
        }


        fputcsv($file, $columns, ",", '"', "\\");

        foreach ($donors as $donor) {
            $row = [];
            foreach ($columns as $col) {
                $row[] = $donor[$col] ?? '';
            }
            fputcsv($file, $row, ",", '"', "\\");
        }

        fclose($file);
    }

    public function clearArchivedData(): void {
        $this->runInTransaction(function (){
            $archivedData = $this->donorRepo->clearArchivedData();
            if (!$archivedData) {
                throw new Exception("Cannot clear archived data!");
            }
        });
    }

    public function getAllActiveDonors(): array 
    {
        return $this->donorRepo->findAllActiveDonors();
    }
    
}
