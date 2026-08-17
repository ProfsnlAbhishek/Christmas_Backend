The problem is that your HTML is not complete. You open the <table>, <tbody>, and <tr> tags, but you never close them. Also, your last </tr is missing the closing >.

Here's the corrected version:

<?php

function createChildByID(array $result, int $childID)
{
    if (empty($result)) {
        return "<h2>No records found.</h2>";
    }

    $html = "";

    $html .= '
        <h2 style="text-align:center;">
            ADOPT A CHILD CHRISTMAS LIST <br>' . htmlspecialchars(date("m/d/Y")) . '
        </h2>

        <table
            border="1"
            cellpadding="5"
            style="
                width:100%;
                border-collapse:collapse;
            "
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
                <tr>
                    <td>' . htmlspecialchars($result["childID"]) . '</td>
                    <td>' . htmlspecialchars($result["f_name"]) . '</td>
                    <td>' . htmlspecialchars($result["l_name"]) . '</td>
                    <td>' . htmlspecialchars($result["donor_name"]) . '</td>
                    <td>' . htmlspecialchars($result["worker"]) . '</td>
                </tr>
            </tbody>
        </table>
    ';

    return $html;
}