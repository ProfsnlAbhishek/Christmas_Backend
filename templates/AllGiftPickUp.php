<?php

function createGiftPickUp(array $results)
{

    if (empty($results)) {

        return "<h2>No records found.</h2>";

    }


  $imagePath = __DIR__ . '../files/christmas_small.jpg';

    $html = '

    <h2>
        ' . date("Y") . ' PROJECT KARE<br>
        ~ GIFT PICKUP DATES ~
    </h2>

       <div style="text-align:center; margin-top:10px; margin-bottom:20px;">
        <img src="' . $imagePath . '" 
             style="width:80px; height:auto;">
    </div>


    ';



 foreach ($results as $row) {

        // Format date
        $formattedDate = date(
            "F j, Y",
            strtotime($row["pick_date"])
        );

        // Only show time if it exists
        $timePart = '';

        if (!empty(trim($row["pick_time"] ?? ''))) {
            $formattedTime = date(
                "g:i A",
                strtotime($row["pick_time"])
            );

            $timePart = '
                at
                <span class="pickup-time">
                    ' . htmlspecialchars($formattedTime) . '
                </span>
            ';
        }

        $html .= '
        <div class="pickup-item">
            <span class="pickup-date">
                ' . htmlspecialchars($formattedDate) . '
            </span>

            ' . $timePart . '

            ---

            <span class="donor-name">
                ' . htmlspecialchars($row["donor_name"]) . '
            </span>
        </div>
        ';
    }

    return $html;
}

?>
