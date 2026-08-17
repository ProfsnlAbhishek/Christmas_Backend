<?php

namespace Christmas\Service;

use PDO;
use Exception;
use Christmas\Entity\DonorContact;
use Christmas\Repository\DonorContactRepository;


class DonorContactService extends BaseService {
    private DonorContactRepository $contactRepo;

    public function __construct(PDO $db, DonorContactRepository $contactRepo)
    {
        parent::__construct($db);
        $this->contactRepo = $contactRepo;
    }

    public function createContactDonor(array $data): DonorContact
    {
        $contactdonor = new DonorContact($data);

        return $this->runInTransaction(function () use ($contactdonor) {
            $contactdonor = $this->contactRepo->insert($contactdonor);

            if (!$contactdonor->contactID) {
                throw new Exception("Donor Contact Creation Failed");
            }

            return $contactdonor;
        });
    }

    public function deleteContactDonor(int $contactID): void
    {
        $this->runInTransaction(function () use ($contactID){
            $deleted = $this->contactRepo->delete($contactID);

            if (!$deleted){
                throw new Exception("Donor Contact not found or could not be deleted");
            }
        });
    }

    public function getAllContactsById(int $donorID): array
    {
        $contactdonor = $this->contactRepo->getAllContactById($donorID);
        // if (!$contactdonor) {
        //     throw new Exception("Donor Contacts not found");
        // }

        return $contactdonor;
    }


}


