<?php

function createAllChildByDonor(array $results, int $donorID)
{
    if (empty($results)) {
        return "<h2>No records found.</h2>";
    }

    $html = "";

    
    //   Group records by donor name
    $grouped = [];

    foreach ($results as $row) {
        $grouped[$row["donor_name"]][] = $row;
    }


    
    //  If one donor selected

    if ($donorID != 0) {

        $grouped = [
            $results[0]["donor_name"] => $results
        ];
    }


    $grandTotal = 0;
    $firstPage = true;


    foreach ($grouped as $rows) {

        // New page for every donor except first one
        if (!$firstPage) {
            $html .= '<pagebreak />';
        }

        $firstPage = false;


        // Build donor page
        $html .= buildDonorPage($rows);


        $grandTotal += count($rows);
    }



    if ($donorID == 0) {

        $html .= '

        <pagebreak />

        <h2 style="text-align:center;">
            Summary
        </h2>


        <table 
            border="1"
            cellpadding="5"
            cellspacing="0"
            style="
                width:100%;
                border-collapse:collapse;
            "
        >

            <tr>
                <td style="font-weight:bold;">
                    Total Children:
                </td>

                <td style="font-weight:bold;">
                    ' . $grandTotal . '
                </td>
            </tr>

        </table>

        ';
    }


    return $html;
}




function buildDonorPage(array $results)
{
    $donor = $results[0];

    $totalChildren = count($results);


    $html = '

    <h2 style="text-align:center;">
        ADOPT A CHILD CHRISTMAS LIST<br>
        ' . date("m/d/Y") . '
    </h2>


    <h4 style="text-align:center;">
        Donor:<br>
        ' . htmlspecialchars($donor["donor_name"]) . '
    </h4>

    ';



    
    //  Donor information

    if (!empty($donor["toy_dr"])) {

        $html .= '

        <p style="text-align:center;">
            Toys: ' . htmlspecialchars($donor["toy_dr"]) . '
        </p>

        ';
    }



    if (!empty($donor["stockings"])) {

        $html .= '

        <p style="text-align:center;">
            Stockings: ' . htmlspecialchars($donor["stockings"]) . '
        </p>

        ';
    }



    
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

                <th>
                    First Name
                </th>

                <th>
                    Child ID
                </th>

            </tr>

        </thead>


        <tbody>

    ';



    foreach ($results as $row) {

        $html .= '

            <tr>

                <td>
                    ' . htmlspecialchars($row["f_name"]) . '
                </td>


                <td>
                    ' . htmlspecialchars($row["childID"]) . '
                </td>

            </tr>

        ';
    }



    /*
     * Total row inside table
     */
    $html .= '

            <tr>

                <td 
                    style="
                        text-align:right;
                        font-weight:bold;
                    "
                >
                    Total Children
                </td>


                <td 
                    style="
                        font-weight:bold;
                    "
                >
                    ' . $totalChildren . '
                </td>

            </tr>


        </tbody>

    </table>

    ';


    return $html;
}

?>
