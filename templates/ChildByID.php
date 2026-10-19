
<?php

function createChildByID(array $result, int $childID)
{
    // No results returned
    if (empty($result)) {
        return "<h2>No records found.</h2>";
    }

    // Start HTML
    $html = "";

    $html .= '
        <h2 style="text-align:center;">
            ADOPT A CHILD CHRISTMAS LIST <br>' . htmlspecialchars(date("m/d/Y")) . '
        </h2>

        <table
            border="1"
            cellpadding="5"
            style="width:100%; border-collapse:collapse;"
        >
            <thead>
                <tr>
                    <th>ID</th>
                    <th>FIRST NAME</th>
                    <th>LAST NAME</th>
                    <th>ADOPTOR</th>
                    <th>WORKER</th>
                </tr>
            </thead>

            <tbody>
    ';

    // Loop through multiple child rows
    foreach ($result as $row) {
        $html .= '
            <tr>
                <td>' . htmlspecialchars($row["childID"]) . '</td>
                <td>' . htmlspecialchars($row["f_name"]) . '</td>
                <td>' . htmlspecialchars($row["l_name"]) . '</td>
                <td>' . htmlspecialchars($row["donor_name"]) . '</td>
                <td>' . htmlspecialchars($row["worker"]) . '</td>
            </tr>
        ';
    }

    // Close table
    $html .= '
            </tbody>
        </table>
    ';

    return $html;
}