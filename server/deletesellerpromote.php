<?php
include_once("dbconnect.php");
$prid = $_POST['prid'];
$prname = $_POST['prname'];
$prtype=$_POST['prtype'];
$prprice=$_POST['prprice'];
$prqty=$_POST['prqty'];
$sqldelete = "DELETE FROM tbl_promotion WHERE prid = '$prid' AND prname='$prname' AND prtype = '$prtype' AND prprice = '$prprice' AND prqty = '$prqty'";
$stmt = $conn->prepare($sqldelete);
if ($stmt->execute()) {
    echo "success";
} else {
    echo "failed";
}
?>