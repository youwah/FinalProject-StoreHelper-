<?php
include_once("dbconnect.php");
$email = $_POST['email'];
$prid = $_POST['prid'];

$sqldelete = "DELETE FROM tbl_favorite WHERE email='$email' AND prid = '$prid'";
$stmt = $conn->prepare($sqldelete);
if ($stmt->execute()) {
    echo "success";
} else {
    echo "failed";
}
?>