<?php

namespace Christmas\Controller;

use Christmas\Service\LookupService;

class LookupController extends BaseController
{
    private LookupService $service;

    public function __construct(LookupService $service)
    {
       $this->service = $service;
    }

    public function getGiftCardTypes(): void
    {
        $this->sendJson($this->service->getGiftCardTypes());
    }

    public function getRace(): void
    {
        $this->sendJson($this->service->getRace());
    }
}