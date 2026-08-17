<?php
namespace Christmas\Service;

use PDO;

use Exception;
use Christmas\Entity\Clothes;
use Christmas\Repository\ClothingRepository;

class ClothingService extends BaseService
{
    private ClothingRepository $clothRepo;

    public function __construct(
        PDO $db,
        ClothingRepository $clothRepo,
    ){
        parent::__construct($db);
        $this->clothRepo = $clothRepo;
    }

    public function getAllClothesType(): array{
        $rows = $this->clothRepo->findAll();
        return array_map(fn($row) => new Clothes($row), $rows);
    }

    public function getAllSizeByClothing(int $typeID) : array{
        $rows = $this->clothRepo->getSizeByClothing($typeID);
        return $rows;
    }
}