<?php

require_once "rights.php";
require_once "../model/emp_database.php";
require_once "../check_user.php";

$username = filter_input(INPUT_COOKIE, "username");
$isUser = checkUser($username);

if ($isUser == true) {
    $userID = filter_input(INPUT_COOKIE, "userID");
    //edit next line to match user permissions column
    $rights = Rights::getApplicationRights($userID, "Christmas");
    if ($rights != "NONUSER" && $rights !== null) {
        readfile("index.html");
    } else {
        header("Location: ../LaunchPad/");
    }
} else {
    header("Location: ../Login/");
}
?>
