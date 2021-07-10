<?php

include_once("dbconnect.php");

$user_email = $_POST['email'];
$name = $_POST['name'];
$country = $_POST['country'];
$phonenum = $_POST['phonenum'];

$sql = "SELECT * FROM tbl_seller WHERE user_email = '$user_email'";
$result = $conn->query($sql);
    if ($result->num_rows > 0) {
        $sqlupdate = "UPDATE tbl_seller SET name = '$name', country = '$country', phonenum = '$phonenum' WHERE user_email = '$user_email'";
        if ($conn->query($sqlupdate) === TRUE){
                
                echo 'success';
        }else{
                echo 'failed';
        }
    }else{
        echo "failed";
    }

?>