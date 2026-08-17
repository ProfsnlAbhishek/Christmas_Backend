<?php
namespace Christmas\Controller;


use Christmas\Service\DonorContactService;
use Christmas\Entity\DonorContact;
use Exception;

class DonorContactController extends BaseController
{
    private DonorContactService $donorContactService;

    public function __construct(DonorContactService $donorContactService)
    {
        $this->donorContactService = $donorContactService;
    }

    public function getAllContactsByID(int $donorID): void {
        try{
            $donorContacts = $this->donorContactService->getAllContactsById($donorID);
            $this->sendJson($donorContacts);
        
        }catch (Exception $e) {
            $this->sendError("Donor Contact Not Found",404);
        }
    }

    public function createDonorContact(array $data): void {
        try{
            $created = $this->donorContactService->createContactDonor($data);
            $this->sendJson($created);
        }catch (Exception $e){
            $this->sendError($e->getMessage(), 400);
        }
    }

    public function deleteDonorContact(int $contactID): void {
        try{
            $this->donorContactService->deleteContactDonor($contactID);
            $this->sendJson(null, 204);

        }catch (Exception $e){
            $this->sendError($e->getMessage(), 400);
        }
    }

}