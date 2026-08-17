<?php

//add program name to front of controller
namespace Christmas\Controller;

use Exception;

abstract class BaseController
{
    protected bool $terminate = true;

    public function disableTermination(): void 
    {
        $this->terminate = false;
    }

    protected function sendJson(mixed $data, int $status = 200): void 
    {
        http_response_code($status);
        header('Content-Type: application/json');

        echo json_encode($data);
        if($this->terminate){
            exit;
        }
    }

    protected function sendError(string $message, int $status = 400): void 
    {
        http_response_code($status);
        header('Content-Type: application/json');

        echo json_encode([
            'error' => $message
        ]);

        if ($this->terminate) {
            exit;
        }
    }

    protected function handleException(Exception $e): void 
    {
        // Log internally
        error_log($e->getMessage());
        $this->sendError("Internal server error", 500);
    }
}