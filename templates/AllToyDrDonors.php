<?php

function createToyDrDonors(array $results)
{
    if (empty($results)) {
        return "
        <div style='
            max-width:600px;
            margin:50px auto;
            padding:30px;
            text-align:center;
            background:#ffffff;
            border:1px solid #000;
            border-radius:8px;
            font-family:Arial, sans-serif;
            font-size:18px;
        '>
            No toy drive donors found.
        </div>";
    }

    return buildToyDrPage($results);
}


function buildToyDrPage(array $results)
{
    $html = '

    <style>
        body {
            background:#ffffff;
            font-family:"Times New Roman", serif;
            color:#000;
        }

        .toy-container {
            width:90%;
            max-width:650px;
            margin:40px auto;
        }

        .header {
            text-align:center;
            border-bottom:3px solid #000;
            padding-bottom:15px;
            margin-bottom:25px;
        }

        .header h1 {
            margin:0;
            font-size:36px;
            font-weight:bold;
        }

        .date {
            font-size:16px;
            margin-top:8px;
        }

        .card {
            border:1px solid #000;
            border-radius:8px;
            padding:20px;
        }

        .title {
            text-align:center;
            font-size:26px;
            font-weight:bold;
            padding-bottom:12px;
            margin-bottom:15px;
            border-bottom:2px solid #000;
        }

        .donor-row {
            font-size:16px;
            padding:12px 10px;
            border-bottom:1px solid #ccc;
            text-align:center;
        }

        .donor-row:last-child {
            border-bottom:none;
        }

        .donor-row:hover {
            background:#f5f5f5;
        }

        .total {
            margin-top:25px;
            border:2px solid #000;
            padding:18px;
            text-align:center;
            font-size:22px;
            font-weight:bold;
            border-radius:8px;
        }

        @media(max-width:600px){
            .header h1 {
                font-size:28px;
            }

            .donor-row {
                font-size:18px;
            }
        }

    </style>


    <div class="toy-container">

        <div class="header">
            <h1>Donors That Held Toy Drives</h1>
            <div class="date">
                '.date("m/d/Y").'
            </div>
        </div>


        <div class="card">

            <div class="title">
                Donor Name
            </div>
    ';


    foreach ($results as $row) {

        $html .= '
            <div class="donor-row">
                '.htmlspecialchars($row['donor_name']).'
            </div>
        ';
    }


    $html .= '

        </div>


        <div class="total">
            Total Donors: '.count($results).'
        </div>


    </div>';

    return $html;
}

?>
