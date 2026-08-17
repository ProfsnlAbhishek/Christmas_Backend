<?php

namespace Christmas\Repository;
use PDO;
use InvalidArgumentException;

class LookupRepository{
    protected PDO $db;
    protected string $table;
    protected string $column;

    private const TABLE_MAP  = [
        "clothing_types" => "clothing_type",
        "clothing_sizes" => "size",
        "gift_card_types" => "gift_card",
        "race" => "race",

    ];

    public function __construct(PDO $db, string $table)
    {
        if (!isset(self::TABLE_MAP[$table])) {
            throw new InvalidArgumentException("Invalid lookup table: {$table}",);
        }

        $this->db = $db;
        $this->table = $table;
        $this->column = self::TABLE_MAP[$table];
    }

    public function findAll(): array
    {
        $stmt = $this->db->query(
            "SELECT {$this->column} FROM {$this->table} ORDER BY {$this->column}"
        );
        return $stmt->fetchAll(PDO::FETCH_COLUMN);
    }

    public function exists(string $value) : bool 
    {
        $stmt = $this->db->prepare(
            "SELECT 1 FROM {$this->table} WHERE {$this->column} = :value LIMIT 1"
        );
        $stmt->execute(["value" => $value]);
        return (bool) $stmt->fetchColumn();
    }


    


}