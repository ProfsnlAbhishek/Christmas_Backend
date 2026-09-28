<?php

namespace Christmas\Service;

require_once "../templates/AllChildByDonor.php";
require_once "../templates/ChildByID.php";
require_once "../templates/AllChildByWorker.php";
require_once "../templates/AllGiftCard.php";
require_once "../templates/AllLottery.php";
require_once "../templates/AllGiftPickUp.php";
require_once "../templates/AllDonors.php";
require_once "../templates/AllToyDrDonors.php";
require_once "../templates/AllStockingsDonor.php";
require_once "../templates/AllActiveDonors.php";

use Christmas\Repository\ReportingRepository;

use Mpdf\Mpdf;
use Spatie\Browsershot\Browsershot;

use PDO;
class ReportingService extends BaseService
{
    private ReportingRepository $reportingRepo;
  

    public function __construct(PDO $db, ReportingRepository $reportingRepo )
    {
        parent::__construct($db);
        $this->reportingRepo = $reportingRepo;
    }

    public function createAllChildByDonor(int $donorID)
    {
        $data = null;
        if ($donorID === 0) {
            // some repository implementations may not have a dedicated method for "all donors"
            if (method_exists($this->reportingRepo, 'getAllChildByAllDonor')) {
                $data = $this->reportingRepo->getAllChildByAllDonor();
            } else {
                // fallback: use the single-donor method with donorID 0 to request all
                $data = $this->reportingRepo->getAllChildByDonor(0);
            }
        } else {
            $data = $this->reportingRepo->getAllChildByDonor($donorID);
        }

        $html = createAllChildByDonor($data, $donorID);

        $mpdf = new Mpdf(["orientation" => "P", "shrink_tables_to_fit" => 1]);



        $css = '
        <style>
        table {
            border-collapse: collapse;
            width: 100%;
            table-layout: auto;
        }
        th, td {
            border: 1px solid black;
            padding: 5px;
        }
        td {
            font-size: 8pt; /* smaller font for data rows */
            white-space: normal;
            word-wrap: break-word;
        }
        th {
            background-color: #f2f2f2; /* optional header shading */
        }
        h1 {
            font-size: 14pt; /* optional header size */
            margin: 0;
        }
        </style>



    ';

        $mpdf->WriteHTML($css);
        $mpdf->WriteHTML($html);

        $mpdf->Output(
            "AllChildsByDonorID" . $donorID . ".pdf",
            "D",
        );
        exit();
    }


    public function createChildByID(int $childID)
    {
        $data = $this->reportingRepo->getChildByID($childID);


        $html = createChildByID($data, $childID);

        $mpdf = new Mpdf(["orientation" => "P", "shrink_tables_to_fit" => 1]);


        $css = '
        <style>
        table {
            border-collapse: collapse;
            width: 100%;
            table-layout: auto;
        }
        th, td {
            border: 1px solid black;
            padding: 5px;
        }
        td {
            font-size: 8pt; /* smaller font for data rows */
            white-space: normal;
            word-wrap: break-word;
        }
        th {
            background-color: #f2f2f2; /* optional header shading */
        }
        h1 {
            font-size: 14pt; /* optional header size */
            margin: 0;
        }
        </style>



    ';

        $mpdf->WriteHTML($css);
        $mpdf->WriteHTML($html);

        $mpdf->Output("ChildByID" . $childID . ".pdf", "D",);

        exit();
    }

    public function createAllChildByWoker(int $workerID)
    {
        $data = null;
        if ($workerID === 0) {
            if (method_exists($this->reportingRepo, 'getAllChildsByAllWorker')) {
                $data = $this->reportingRepo->getAllChildsByAllWorker();
            } else {
                $data = $this->reportingRepo->getAllChildsByWorker(0);
            }
        } else {
            $data = $this->reportingRepo->getAllChildsByWorker($workerID);
        }


        $html = createAllChildByWorker($data, $workerID);

        $mpdf = new Mpdf(["orientation" => "P", "shrink_tables_to_fit" => 1]);



        $css = '
        <style>
        table {
            border-collapse: collapse;
            width: 100%;
            table-layout: auto;
        }
        th, td {
            border: 1px solid black;
            padding: 5px;
        }
        td {
            font-size: 8pt; /* smaller font for data rows */
            white-space: normal;
            word-wrap: break-word;
        }
        th {
            background-color: #f2f2f2; /* optional header shading */
        }
        h1 {
            font-size: 14pt; /* optional header size */
            margin: 0;
        }
        </style>



    ';

        $mpdf->WriteHTML($css);
        $mpdf->WriteHTML($html);

        $mpdf->Output(
            "AllChildsByWorker" . $workerID . ".pdf",
            "D",
        );
        exit();
    }
    public function createGiftCardTypes()
    {
        $data = $this->reportingRepo->getGiftCard();
        $html = createGiftCardTypes($data);


        $mpdf = new Mpdf(["orientation" => "P", "shrink_tables_to_fit" => 1]);



        $css = '
        <style>
        table {
            border-collapse: collapse;
            width: 100%;
            table-layout: auto;
        }
        th, td {
            border: 1px solid black;
            padding: 5px;
        }
        td {
            font-size: 8pt; /* smaller font for data rows */
            white-space: normal;
            word-wrap: break-word;
        }
        th {
            background-color: #f2f2f2; /* optional header shading */
        }
        h1 {
            font-size: 14pt; /* optional header size */
            margin: 0;
        }
        </style>



    ';

        $mpdf->WriteHTML($css);
        $mpdf->WriteHTML($html);

        $mpdf->Output(
            "AllGiftCards.pdf",
            "D",
        );
        exit();
    }





public function createLottery()
{
    // Get data
    $data = $this->reportingRepo->getLottery();

    // Build HTML from AllLottery.php
    $html = createLottery($data);

    // Generate PDF with Chrome/Browsershot
    $output = Browsershot::html($html)
        ->setChromePath(
            'C:/Program Files/Google/Chrome/Application/chrome.exe'
        )
        ->format('Letter')
        ->showBackground()
        ->margins(10, 10, 10, 10)
        ->addChromiumArguments([
            'headless=new',
            'disable-gpu',
            'disable-dev-shm-usage',
            'no-sandbox',
        ])
        ->pdf();

    // Clean previous output
    while (ob_get_level()) {
        ob_end_clean();
    }

    // Send PDF to browser
    header('Content-Type: application/pdf');
    header(
        'Content-Disposition: attachment; filename="AllLottery.pdf"'
    );
    header(
        'Content-Length: ' . strlen($output)
    );

    echo $output;

    exit;
}



public function createGiftPickUp()
{
    $data = $this->reportingRepo->getGiftPickUpRpt();


    // Generate HTML
    $html = createGiftPickUp($data);


    $css = '
    <style>

        body {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12pt;
        }


        h2 {
            text-align:center;
            font-size:20pt;
            margin-bottom:25px;
        }


        .pickup-item {

            font-size:16pt;

            padding:8px;

            margin-bottom:8px;

            border-bottom:1px solid #cccccc;

        }


        .pickup-date {

            color:#1f4e79;
            font-weight:bold;

        }




        .donor-name {

            color:#000000;
            font-weight:bold;

        }


    </style>
    ';



    $mpdf = new Mpdf([
        "orientation" => "P",
        "tempDir" => __DIR__ . "/tmp"
    ]);



    // Footer
    $mpdf->SetFooter('
        <div style="
            width:100%;
            font-size:8pt;
            text-align:center;
        ">
            Project Kare Gift Pickup
            |
            Page {PAGENO} of {nbpg}
        </div>
    ');



    // Add CSS
    $mpdf->WriteHTML(
        $css,
        \Mpdf\HTMLParserMode::HEADER_CSS
    );


    // Add content
    $mpdf->WriteHTML($html);



    $mpdf->Output(
        "GiftPickup.pdf",
        "D"
    );


    exit;
}



public function createDonorInformation(int $donorID)
{
    if ($donorID === 0) {
        $data = $this->reportingRepo->getAllDonorsInfoActive();
        $contact = $this->reportingRepo->getAllContactOfAllDonor();
    } else {
        $data = $this->reportingRepo->getDonorInfoActive($donorID);
        $contact = $this->reportingRepo->getContactOfDonor($donorID);
    }

    if (!function_exists('createAllDonor')) {
        throw new \RuntimeException(
            'createAllDonor() was not loaded.'
        );
    }

    $html = createAllDonor(
        $data,
        $contact,
        $donorID
    );

    if (empty(trim($html))) {
        throw new \RuntimeException(
            'createAllDonor() returned empty HTML.'
        );
    }

    // Save HTML for debugging
    $debugPath = 'C:/temp/DonorInformation_debug.html';

    file_put_contents(
        $debugPath,
        $html
    );

    try {

        $pdf = Browsershot::html($html)
            ->setChromePath(
                'C:/Program Files/Google/Chrome/Application/chrome.exe'
            )
            ->format('Letter')
            ->showBackground()
            ->margins(10, 10, 10, 10)
            ->addChromiumArguments([
                'headless=new',
                'disable-gpu',
                'disable-dev-shm-usage',
                'no-sandbox',
            ])
            ->pdf();

    } catch (\Throwable $e) {

        throw new \RuntimeException(
            'Browsershot failed: ' . $e->getMessage(),
            0,
            $e
        );
    }

    if (empty($pdf)) {
        throw new \RuntimeException(
            'Browsershot returned an empty PDF.'
        );
    }

    // IMPORTANT:
    // A PDF should start with %PDF
    if (substr($pdf, 0, 4) !== '%PDF') {
        file_put_contents(
            'C:/temp/invalid_pdf_output.txt',
            $pdf
        );

        throw new \RuntimeException(
            'Chrome did not return valid PDF data. ' .
            'The output does not start with %PDF.'
        );
    }

    // Clean any accidental output before sending PDF
    while (ob_get_level()) {
        ob_end_clean();
    }

    header('Content-Type: application/pdf');
    header(
        'Content-Disposition: attachment; filename="DonorInformation.pdf"'
    );
    header('Content-Length: ' . strlen($pdf));
    header('Cache-Control: private, max-age=0, must-revalidate');
    header('Pragma: public');

    echo $pdf;
    exit;
}


public function createToyDrDonors()
{

  
        
    $data = $this->reportingRepo->getAllToyDrDonors();


    $html = createToyDrDonors($data);



    $mpdf = new \Mpdf\Mpdf([
        "orientation"=>"P",
        "format"=>"Letter"
    ]);



    $mpdf->WriteHTML($html);



    $mpdf->Output(
        "ToyDriveReport.pdf",
        "D"
    );

    exit;

}
public function createStockingsDonors()
{

  
        
    $data = $this->reportingRepo->getAllStockingsDonor();


    $html = createStockingsDonors($data);



    $mpdf = new \Mpdf\Mpdf([
        "orientation"=>"P",
        "format"=>"Letter"
    ]);



    $mpdf->WriteHTML($html);



    $mpdf->Output(
        "StockingDonorReport.pdf",
        "D"
    );

    exit;

}







public function createActiveDonors()
{

  
        
    $data = $this->reportingRepo->getAllActiveDonors();
    // $data = $this->donorRepo->getAllActiveDonors();


    $html = createActiveDonors($data);



    $mpdf = new \Mpdf\Mpdf([
        "orientation"=>"P",
        "format"=>"Letter"
    ]);



    $mpdf->WriteHTML($html);



    $mpdf->Output(
        "AllActiveDonors.pdf",
        "D"
    );

    exit;

}



}



 