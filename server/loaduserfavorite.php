<?php
include_once("dbconnect.php");
$email = $_POST['email'];

$sqlloadcart = "SELECT * FROM tbl_favorite INNER JOIN tbl_products ON tbl_favorite.prid = tbl_products.prid WHERE tbl_favorite.email = '$email'";;

$result = $conn->query($sqlloadcart);

if ($result->num_rows > 0) {
    $products['cart'] = array();
    while ($row = $result->fetch_assoc()) {
        $productlist['productId'] = $row['prid'];
        $productlist['productName'] = $row['prname'];
        $productlist['productType'] = $row['prtype'];
     
        $productlist['price'] = $row['prprice'];
        $productlist['cartqty'] = $row['qty'];
        $productlist['prqty'] = $row['prqty'];
       
        array_push($products['cart'], $productlist);
    }
    echo json_encode($products);
} else {
    echo "nodata";
}

?>