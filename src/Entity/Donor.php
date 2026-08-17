<?php

namespace Christmas\Entity;
use Christmas\Entity\BaseEntity;

class Donor extends BaseEntity{
    public ?int $donorID = null;
    public string $donor_name;
    public string $address1;
    public string $address2;
    public string $city;
    public string $state;
    public string $zip;
    public string $pick_date;
    public string $pick_assigned_to;
    public ?string $pick_det = '';
    public ?int $kids_tag = 0;
    public ?int $age0_11 = 0;
    public ?int $age12abv = 0;
    public ?int $gift_tag = 0;
    public ?int $inf_boy = 0;
    public ?int $inf_girl = 0;
    public ?int $tod_boy = 0;
    public ?int $tod_girl = 0;
    public ?int $age6_10b = 0;
    public ?int $age6_10g = 0;
    public ?int $age11_14b = 0;
    public ?int $age11_14g = 0;
    public ?int $age15_18b = 0;
    public ?int $age15_18g = 0;
    public ?bool $toy_dr = false;
    public ?string $instruction;
    public ?bool $active = true;

}

