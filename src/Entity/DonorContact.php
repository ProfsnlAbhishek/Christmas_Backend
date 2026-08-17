<?php

namespace Christmas\Entity;

use Christmas\Entity\BaseEntity;

class DonorContact extends BaseEntity{
    public ?int $contactID = null;
    public int $donorID;
    public string $contact_name;
    public string $contact_phone;
    public ?string $email = null;
    public ?string $alternate_phone = null;
    public ?string $fax = null; 
}


