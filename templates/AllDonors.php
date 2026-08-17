<?php

function createAllDonor(array $resDonor, array $resContact, int $donorID)
{
    if (empty($resDonor)) {
        return "<h2>No records found.</h2>";
    }

    $grouped = [];

    foreach ($resContact as $contact) {
        $grouped[$contact["donorID"]][] = $contact;
    }

    // CSS only once
    $html = '
    <style>

        @page {
            size: Letter;
        }

        .donor-page {
            break-after: page;
            page-break-after: always;

            break-inside: avoid;
            page-break-inside: avoid;
        }

        .donor-page:last-child {
            break-after: auto;
            page-break-after: auto;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
        }

        .title {
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            background: #d9d9d9;
            border: 1px solid #000;
            border-radius: 5px;
            padding: 5px;
            width: 220px;
            margin: auto;
        }

        .field {
            border-bottom: 1px solid #000;
            font-size: 14px;
            font-weight: bold;
            padding: 3px;
            min-height: 18px;
        }

        .label {
            font-style: italic;
            font-size: 11px;
            padding-left: 10px;
            margin-top: 2px;
        }

        .tagField {
            font-size: 14px;
            font-weight: bold;
            padding: 3px;
            min-height: 18px;
        }

        .tagLabel {
            border-top: 1px solid #000;
            font-style: italic;
            font-size: 11px;
            padding-left: 10px;
            margin-top: 2px;
        }

        .row {
            width: 100%;
            margin-top: 15px;
        }

    </style>
    ';

    // Add each donor
    foreach ($resDonor as $row) {

        $html .= '
        <div class="donor-page">
            ' .
            buildDonorsPage(
                $row,
                $grouped[$row["donorID"]] ?? []
            )
            . '
        </div>';
    }

    return $html;
}





function buildDonorsPage(array $donor, $contact)
{


    $pickDate = "";

    if (!empty($donor["pick_date"])) {

        $date = strtotime($donor["pick_date"]);

        if ($date) {
            $pickDate = date("F j, Y", $date);
        }
    }



    $pickTime = "";

    if (!empty($donor["pick_date"])) {

        $time = strtotime($donor["pick_date"]);

        if ($time) {
            $pickTime = date("g:i A", $time);
        }
    }




    $contactsHtml = '';

if (!empty($contact)) {
    

    foreach ($contact as $c) {

    $contactsHtml .= '
    <br>

    <div class="field">
        NAME: '.htmlspecialchars($c["contact_name"]).'
        | PHONE: '.htmlspecialchars($c["contact_phone"]).'
        | EMAIL: '.htmlspecialchars($c["email"]).'
        <br>
        ALT: '.htmlspecialchars($c["alternate_phone"]).'
        | FAX: '.htmlspecialchars($c["fax"]).'
    </div>

    <div class="label">
        Contact
    </div>

    ';

}
}





    $html = '
   



<div style="position:relative; width:100%; margin-bottom:15px;">

    <div class="title">
        Donor Information
        <br>
        <span style="font-size:12px; font-weight:normal;">
            '.date("m/d/Y").'
        </span>
    </div>

</div>





    <div class="row">

        <div class="field">
            '.htmlspecialchars($donor["donor_name"]).'
        </div>

        <div class="label">
            Donor/Organization Name
        </div>

    </div>




    <div class="row">

        <div class="field">
            '
            .htmlspecialchars(
                trim(
                    $donor["address1"]." ".$donor["address2"]
                )
            )
            .'
        </div>

        <div class="label">
            Address
        </div>

    </div>






   <table 
    width="100%" 
    border="0" 
    cellpadding="0" 
    cellspacing="0"
    style="margin-top:15px;"
>

<tr>

<td width="45%">

    <div class="field">
        '.htmlspecialchars($donor["city"]).'
    </div>

    <div class="label">
        City
    </div>

</td>


<td width="20%">

    <div class="field">
        '.htmlspecialchars($donor["state"]).'
    </div>

    <div class="label">
        State
    </div>

</td>


<td width="35%">

    <div class="field">
        '.htmlspecialchars($donor["zip"]).'
    </div>

    <div class="label">
        Zip
    </div>

</td>


</tr>

</table>

'.$contactsHtml.'





    <table 
    width="100%" 
    border="0" 
    cellpadding="0" 
    cellspacing="0"
    style="margin-top:15px;"
>

<tr>

<td width="50%">

    <div class="field">
        '.htmlspecialchars($pickDate).'
    </div>

    <div class="label">
        Pick Up Date
    </div>

</td>


<td width="50%">

    <div class="field">
        '.htmlspecialchars($pickTime).'
    </div>

    <div class="label">
        Pick Up Time
    </div>

</td>


</tr>

</table>






    <div class="row">

        <div class="field">
            '.htmlspecialchars($donor["pick_assigned_to"]).'
        </div>

        <div class="label">
            Pick Up Assigned To
        </div>

    </div>






    <div class="row">

        <div class="field">
            '.htmlspecialchars($donor["pick_det"]).'
        </div>

        <div class="label">
            Pickup Details
        </div>

    </div>





    <br>



   <div class="title">
    Tags Information
</div>

<br>

<!-- Adopt A Child Tags -->
<table width="100%" border="0" cellpadding="8" cellspacing="0">

<tr>

    <td width="30%">
        <div class="tagField" style="font-size:16px">'.$donor["kids_tag"].'</div>
        <div class="tagLabel" style="font-size:16px">Total Tags</div>
    </td>

    <td width="35%">
        <div class="tagField">'.$donor["age0_11"].'</div>
        <div class="tagLabel">Tags for Children 0-11</div>
    </td>

    <td width="35%">
        <div class="tagField">'.$donor["age12abv"].'</div>
        <div class="tagLabel">Tags for Children 12+</div>
    </td>

</tr>

</table>

<br><br>

<!-- Stockings -->
<table width="100%" border="0" cellpadding="8" cellspacing="0">

<tr>

    <td width="30%">
        <div class="tagField" style="font-size:16px">'.$donor["gift_tag"].'</div>
        <div class="tagLabel" style="font-size:16px">Total Stockings</div>
    </td>

    <td width="35%">
        <div class="tagField">'.$donor["inf_boy"].'</div>
        <div class="tagLabel">Infant Boy</div>
    </td>

    <td width="35%">
        <div class="tagField">'.$donor["inf_girl"].'</div>
        <div class="tagLabel">Infant Girl</div>
    </td>

</tr>

<tr>

    <td>
        <div class="tagField">'.$donor["tod_boy"].'</div>
        <div class="tagLabel">Toddler Boy</div>
    </td>

    <td>
        <div class="tagField">'.$donor["tod_girl"].'</div>
        <div class="tagLabel">Toddler Girl</div>
    </td>

    <td>
        <div class="tagField">'.$donor["age6_10b"].'</div>
        <div class="tagLabel">Age 6-10 Boy</div>
    </td>

</tr>

<tr>

    <td>
        <div class="tagField">'.$donor["age6_10g"].'</div>
        <div class="tagLabel">Age 6-10 Girl</div>
    </td>

    <td>
        <div class="tagField">'.$donor["age11_14b"].'</div>
        <div class="tagLabel">Age 11-14 Boy</div>
    </td>

    <td>
        <div class="tagField">'.$donor["age11_14g"].'</div>
        <div class="tagLabel">Age 11-14 Girl</div>
    </td>

</tr>

<tr>

    <td>
        <div class="tagField">'.$donor["age15_18b"].'</div>
        <div class="tagLabel">Age 15-18 Boy</div>
    </td>

    <td>
        <div class="tagField">'.$donor["age15_18g"].'</div>
        <div class="tagLabel">Age 15-18 Girl</div>
    </td>

    <td>
        <div class="tagField">'.($donor["toy_dr"] ? "YES" : "NO").'</div>
        <div class="tagLabel">Toy Drive</div>
    </td>

</tr>

</table>

   <br>



    <div class="row">

        <div class="field">
            '.htmlspecialchars($donor["instruction"]).'
        </div>

        <div class="label">
            Instruction
        </div>


    </div>



    ';


    return $html;

}
