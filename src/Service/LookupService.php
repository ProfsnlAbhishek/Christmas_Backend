<?php

namespace Christmas\Service;

use PDO;
use Christmas\Repository\LookupRepository;
class LookupService
{

    private LookupRepository $gift_card_types;
    private LookupRepository $race;

    public function __construct(PDO $db)
    {
      
        $this->gift_card_types = new LookupRepository($db, "gift_card_types");
        $this->race = new LookupRepository($db, "race");
    }

    public function getGiftCardTypes(): array
    {
        return $this->gift_card_types->findAll();
    }

    public function getRace(): array
    {
        return $this->race->findAll();
    }



}