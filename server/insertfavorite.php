<?php
include_once("dbconnect.php");
$email = $_POST['email'];
$prid = $_POST['prid'];

$sqlinsert = "INSERT INTO tbl_favorite(email,prid,qty) VALUES ('$email','$prid','1')";

                if ($conn->query($sqlinsert) === TRUE) {
                    echo "success";
                } else {
                    echo "failed";
                }


?>