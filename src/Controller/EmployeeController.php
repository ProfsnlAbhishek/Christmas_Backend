<?php

namespace Christmas\Controller;
use Christmas\Service\EmployeeService;
use Exception;

class EmployeeController extends BaseController 
{
    private EmployeeService $employeeService;

    public function __construct(EmployeeService $employeeService){
        $this->employeeService = $employeeService;
    }

    public function getEmployeeById(int $id): void 
    {
        try{
            $emp = $this->employeeService->getEmployeeById($id);
            $this->sendJson($emp);
        }catch(Exception $e){
            $this->sendError($e->getMessage(), 404);
        }
    }

    public function getAllActiveEmployees(): void 
    {
        try{
            $emps = $this->employeeService->getAllActiveEmployees();
            $this->sendJson($emps);
        }catch(Exception $e){
            $this->sendError($e->getMessage(), 400);
        }
    }

      public function getWorkersChildAssociated(): void{
        try{
            $workers = $this->employeeService->getWorkersChildAssociated();
            $this->sendJson($workers);
        }catch(Exception $e){
            $this->sendError($e->getMessage(), 400);
        }
      }
}