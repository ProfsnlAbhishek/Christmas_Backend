<?php

namespace Christmas\Entity;

use Christmas\Entity\BaseEntity;

class Child extends BaseEntity{
    public ?int $childID = null;
    public string $f_name;
    public string $l_name;
    public ?string $age = "";
    public ?string $sacwisID = null;
    public string $gender = "";
    public string $race;
    public ?string $clothing_type;
    public ?string $size;
    public ?string $shoe_size = null;
    public ?string $gift_card = null;
    public int $workerID ;
    public ?int $donorID;
    public ?string $suggestion = "";

}