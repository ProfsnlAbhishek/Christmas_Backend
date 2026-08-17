<?php

function createGiftCardTypes(array $results)
{
    if (empty($results)) {
        return "<h2>No records found.</h2>";
    }

    $html = "";

    
    //   Group records by gift card
    $grouped = [];

    foreach ($results as $row) {
        $grouped[$row["gift_card"]][] = $row;
    }



    $grandTotal = 0;
    $firstPage = true;


    foreach ($grouped as $rows) {


        if (!$firstPage) {
            $html .= '<pagebreak />';
        }

        $firstPage = false;


        // Build gift card page
        $html .= buildGiftCardPage($rows);


        $grandTotal += count($rows);
    }





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
                    Grand Total:
                </td>

                <td style="font-weight:bold;">
                    ' . $grandTotal . '
                </td>
            </tr>

        </table>

        ';


    return $html;
}




function buildGiftCardPage(array $results)
{
    $donor = $results[0];

    $totalChildren = count($results);


    $html = '

    <h2 style="text-align:center;">
        CHRISTMAS GIFT CERTIFICATE SUMMARIES<br>
        ' . date("m/d/Y") . '
    </h2>


    <h4 style="text-align:center;">
        Gift Card Type:<br>
        ' . htmlspecialchars($donor["gift_card"]) . '
    </h4>

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

                <th>
                    CHILD
                </th>

                <th>
                    ID
                </th>
                <th>
                    WORKER
                </th>

            </tr>

        </thead>


        <tbody>

    ';



    foreach ($results as $row) {

        $html .= '

            <tr>

                <td>
                    ' . htmlspecialchars($row["child_name"]) . '
                </td>


                <td>
                    ' . htmlspecialchars($row["childID"]) . '
                </td>
                <td>
                    ' . htmlspecialchars($row["worker"]) . '
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
