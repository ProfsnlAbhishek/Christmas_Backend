<?php 

namespace Christmas\Service;
use Christmas\Entity\Employee;
use Christmas\Repository\EmployeeRepository;
use PDO;
use Exception;

class EmployeeService extends BaseService 
{
    private EmployeeRepository $empRepo;

    public function __construct(
        PDO $db,
        EmployeeRepository $empRepo,
    ) {
        parent::__construct($db);
        $this->empRepo = $empRepo;
    }

    public function getEmployeeById(int $id): Employee 
    {
        $emp = $this->empRepo->findEmployeeById($id);
        if(!$emp){
            throw new Exception("Employee not found");
        }
        return $emp;
    }

    public function getAllActiveEmployees(): array 
    {
        return $this->empRepo->findActiveEmployees();
    }

    public function getEmpType(int $id): string 
    {
        return $this->empRepo->findEmpTypeById($id);
    }


    public function getWorkersChildAssociated(): array{
        $rows = $this->empRepo->getWorkersChildAssociated();
        return array_map(fn($row) => $row, $rows);
    }

}