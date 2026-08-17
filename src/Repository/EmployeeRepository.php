<?php

namespace Christmas\Repository;
use Christmas\Entity\Employee;
use PDO;

class EmployeeRepository extends BaseRepository 
{
    protected string $table = "employee_data.employee";
    protected string $primaryKey = "Employee_Index";

    public function findEmployeeById(int $id)
    {
        $stmt = $this->db->prepare("
            SELECT Employee_Index, First_Name, Last_Name FROM {$this->table} WHERE {$this->primaryKey} = :id
        ");

        $stmt->execute(["id" => $id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        return $row ? new Employee($row) : null;
    }

    public function findActiveEmployees(): array 
    {
        $stmt = $this->db->prepare("
            SELECT Employee_Index, First_Name, Last_Name FROM {$this->table} WHERE active = 1 ORDER BY Last_Name
        ");

        $stmt->execute();

        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return array_map(fn($row) => new Employee($row), $rows);
    }

    public function findEmpTypeById(int $id): string 
    {
        $stmt = $this->db->prepare("
            SELECT empType FROM employee_data.hr WHERE Employee_Index = :id
        ");

        $stmt->execute(["id" => $id]);

        return $stmt->fetchColumn();
    }

    public function findEmpTitleById(int $id): string 
    {
        $stmt = $this->db->prepare("
            SELECT title FROM employee_data.hr WHERE Employee_Index = :id
        ");

        $stmt->execute(["id" => $id]);

        return $stmt->fetchColumn();
    }

    public function findEmailById(int $id): ?string
    {
        $stmt = $this->db->prepare("
            SELECT email FROM employee_data.directory WHERE Employee_Index = :id
        ");

        $stmt->execute(["id" => $id]);

        return $stmt->fetchColumn();
    }

    public function findSupervisorAdminEmailByDept(string $dept): array
    {
        $stmt = $this->db->prepare("
            SELECT d.email FROM employee_data.directory d JOIN employee_data.employee e ON d.Employee_Index = e.Employee_Index JOIN employee_data.hr h ON d.Employee_Index = h.Employee_Index WHERE d.dept = :dept AND (h.empType = 'SUPERVISOR' OR h.empType = 'ADMINISTRATOR') AND e.active = 1 AND d.email IS NOT NULL
        ");

        $stmt->execute(["dept" => $dept]);

        $rows = $stmt->fetchAll(PDO::FETCH_COLUMN);

        if(!$rows){
            return [];
        } else{
            return $rows;
        }

        
    }

    public function findAllExecutiveEmail(): array 
    {
        $stmt = $this->db->prepare("
            SELECT d.email FROM employee_data.directory d JOIN employee_data.employee e ON d.Employee_Index = e.Employee_Index JOIN employee_data.hr h ON d.Employee_Index = h.Employee_Index WHERE e.active = 1 AND d.email IS NOT NULL AND h.empType = 'EXECUTIVE'
        ");

        $stmt->execute();

        $rows = $stmt->fetchAll(PDO::FETCH_COLUMN);

        if(!$rows){
            return [];
        }else{
            return $rows;
        }
    }


     public function getWorkersChildAssociated(): array{
        $stmt = $this->db->prepare("
            SELECT DISTINCT
                e.Employee_Index AS workerID,
                CONCAT(e.First_Name, ' ', e.Last_Name) AS worker_name
            FROM employee_data.employee e
            JOIN child c
                ON e.Employee_Index = c.workerID;
                
        ");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

   
}