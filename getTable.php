<?php
$w1 = $_POST['win1'];
$servername = "ec2-34-207-252-72.compute-1.amazonaws.com";
$username = "fAjaxDB_user32";
$password = "fAjaxDB_user32";
$dbname = "fAjaxDB_user32";
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
$sql = "INSERT INTO Victories SET Player_Names = '$w1', Score = 1
ON DUPLICATE KEY UPDATE Score = Score + 1;";
if ($conn->query($sql) === FALSE) {
    echo "Error, results invalid: " . $sql . "<br>" . $conn->error;}
$conn->close();
?>