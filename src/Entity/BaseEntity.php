<?php 

//add program name in front of entity
namespace Christmas\Entity;

abstract class BaseEntity
{
    public function __construct(array $data = []){
        foreach ($data as $key => $value) {
            if (property_exists($this, $key)){
                $this->$key = $value;
            }
        }
    }
}
?>