<?php

namespace Christmas\Service;

use PDO;
use Exception;
use Christmas\Entity\Child;
use Christmas\Repository\ChildRepository;

class ChildService extends BaseService
{
    private ChildRepository $childRepo;

    public function __construct(
        PDO $db,
        ChildRepository $childRepo,
    ) {
        parent::__construct($db);
        $this->childRepo = $childRepo;
    }


    public function createChild(array $data): Child
    {
        $child = new Child($data);

        return $this->runInTransaction(function () use ($child) {
            $child = $this->childRepo->insert($child);

            if (!$child->childID) {
                throw new Exception("Child creation failed.");
            }

            return $child;
        });
    }

    public function getAllChilds(): array
    {

        // return $this->childRepo->findAllChilds();
        return array_map(fn($row) => new Child($row), $this->childRepo->findAll());
    }

    public function updateChild(Child $child): Child
    {
        if (!$child->childID) {
            throw new Exception("Child ID is required for update");
        }

        return $this->runInTransaction(function () use ($child) {
            $updated = $this->childRepo->update($child);
            if (!$updated) {
                throw new Exception("Child update failed");
            }

            return $child;
        });
    }

    public function deleteChild(int $childID): void
    {
        $this->runInTransaction(function () use ($childID) {
            $deleted = $this->childRepo->delete($childID);
            if (!$deleted) {
                throw new Exception("Child not found or could not be deleted.");
            }
        });
    }



    public function archiveChildren(string $filepath)
    {

        $columns = $this->childRepo->getColumnName();
        $children = $this->childRepo->findAll();

        $file = fopen($filepath, "w");

        if (!$file) {
            throw new Exception("Unable to write file: $filepath");
        }

        fputcsv($file, $columns, ",", '"', "\\");

        foreach ($children as $child) {
            $row = [];
            foreach ($columns as $col) {
                $row[] = $child[$col] ?? '';
            }
            fputcsv($file, $row, ",", '"', "\\");
        }
        fclose($file);
    }

    public function deleteChildren(): void
    {
        $this->runInTransaction(function () {
            $deleted = $this->childRepo->deleteChildren();
            if (!$deleted) {
                throw new Exception("Could not delete all the childs.");
            }
        });
    }

    public function getAllChildByDonorID(int $donorID): array
    {

        return $this->childRepo->getAllChildByDonorID($donorID);
    }
    public function getAllUnAssociatedChild(): array
    {

        return $this->childRepo->getAllUnAssociatedChild();
    }

    public function associateDonorByChildID(int $childID, int $donorID): void
    {
        $this->runInTransaction(function () use ($childID, $donorID) {
            $this->childRepo->associateDonorByChildID($childID, $donorID);
        });
    }
    public function dissociateDonorByChildID(int $childID): void
    {
        $this->runInTransaction(function () use ($childID) {
            $this->childRepo->dissociateDonorByChildID($childID);
        });
    }


    public function getChildByID(int $childID): array{
        
        return $this->childRepo->getChildByID($childID);
    }
}
