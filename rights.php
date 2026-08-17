<?php

class Rights
{
    public static function getApplicationRights($id, $application)
    {
        $db = empDatabase::getDB();

        $query =
            "SELECT " .
            $application .
            " FROM program_users WHERE Employee_Index = :empID;";

        $statement = $db->prepare($query);
        $statement->bindValue(":empID", $id);
        $statement->execute();
        $row = $statement->fetch();
        $statement->closeCursor();

        return $row[$application];
    }
}
?>
