<?php

//add program name in front of Repository
namespace Christmas\Repository;

use PDO;

abstract class BaseRepository 
{
    protected PDO $db;
    protected string $table;
    protected string $primaryKey;

    public function __construct(PDO $db)
    {
        $this->db = $db;
    }

    public function findById(int $id)
    {
        $stmt = $this->db->prepare(
            "SELECT * FROM {$this->table} WHERE {$this->primaryKey} = :id"
        );

        $stmt->execute(['id' => $id]);

        return $stmt->fetch(PDO::FETCH_ASSOC) ? : null;
    }

    public function findAll(): array 
    {
        $stmt = $this->db->query("SELECT * FROM {$this->table}");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function delete(int $id): bool 
    {
        $stmt = $this->db->prepare(
            "DELETE FROM {$this->table} WHERE {$this->primaryKey} = :id"
        );
        $stmt->execute(['id' => $id]);
        return $stmt->rowCount() > 0;
    }
}