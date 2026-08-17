<?php

namespace Christmas\Entity;

use Christmas\Entity\BaseEntity;


class Lottery extends BaseEntity{
    public ?string $ticketID;
    public ?int $packetID;
    public string $sold_by;
    public string $purchased_by;

}