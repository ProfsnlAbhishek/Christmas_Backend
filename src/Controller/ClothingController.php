<?php

namespace Christmas\Controller;

use Christmas\Service\ClothingService;


use Exception;


class ClothingController extends BaseController
{
    private ClothingService $clothingService;

    public function __construct(ClothingService $clothingSerivce){
        $this->clothingService = $clothingSerivce;
    }

    public function getAllClothingTypes(): void{
        try{
            $clothes = $this->clothingService->getAllClothesType();
            $this->sendJson($clothes);
        }catch (Exception $e){
            $this->sendError($e->getMessage(), 400);
        }
    }

    public function getAllSizesByClothing(int $typeID): void
    {
        try{
            $sizes = $this->clothingService->getAllSizeByClothing($typeID);

            $this->sendJson($sizes);
        }catch (Exception $e){
            $this->sendError($e->getMessage(), 404);
        }

    }

 
}