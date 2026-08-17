<?php

function createLottery(array $results)
{
    if (empty($results)) {
        return "<h2>No records found.</h2>";
    }

    $html = '

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <style>

        @page {
            size: Letter;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 16px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        th,
        td {
            border: 1px solid #000;
            padding: 5px;
            text-align: center;
        }

        /* Column colors */

        th:nth-child(1),
        td:nth-child(1) {
            background-color: #e8f4ff;
        }

        th:nth-child(2),
        td:nth-child(2) {
            background-color: #eaffea;
        }

        th:nth-child(3),
        td:nth-child(3) {
            background-color: #fff4cc;
        }

        th:nth-child(4),
        td:nth-child(4) {
            background-color: #ffe6f0;
        }

        /* Header colors */

        th:nth-child(1) {
            background-color: #b8ddff;
        }

        th:nth-child(2) {
            background-color: #bff0bf;
        }

        th:nth-child(3) {
            background-color: #ffe599;
        }

        th:nth-child(4) {
            background-color: #ffb6d2;
        }

        h2 {
            text-align: center;
            font-size: 16px;
        }

    </style>

</head>

<body>

';

    $html .= buildLotteryPage($results);

    $html .= '

</body>

</html>

';

    return $html;
}



function buildLotteryPage(array $results)
{
    


    $html = '

    <h2 style="text-align:center;">
        Lottery Listing<br>
        ' . date("m/d/Y") . '
    </h2>


    ';


  
    //  Child table

    $html .= '
    <table
        border="1"
        cellpadding="5"
        cellspacing="0"
        style="
            width:100%;
            border-collapse:collapse;
        "
    >
        <thead>
            <tr>
                <th>TICKET #</th>
                <th>PACKET #</th>
                <th>SOLD BY</th>
                <th>PURCHASED BY</th>
            </tr>
        </thead>
        <tbody>
    ';



    foreach ($results as $row) {

    $html .= '
    <tr>
        <td>' . htmlspecialchars($row["ticketID"]) . '</td>
        <td>' . htmlspecialchars($row["packetID"]) . '</td>
        <td>' . htmlspecialchars($row["sold_by"]) . '</td>
        <td>' . htmlspecialchars($row["purchased_by"]) . '</td>
    </tr>';

}



    $html .= '
        </tbody>
    </table>';

return $html;

}

?>
