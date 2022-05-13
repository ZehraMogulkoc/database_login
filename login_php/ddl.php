<?php
$servername = "localhost";
$username = "username";
$password = "password";
$dbname = "myDB";

include 'conn.php';

// Check connection
if ($connect->connect_error) {
  die("Connection failed: " . $connect->connect_error);
}

// sql to create table
$sql = "CREATE TABLE user2 (
id INT(50) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(50) NOT NULL,
password VARCHAR(50) NOT NULL,
email VARCHAR(50),
phone VARCHAR(50)
)";

if ($connect->query($sql) === TRUE) {
  echo "Table user created successfully";
} else {
  echo "Error creating table: " . $connect->error;
}

$connect->close();
?>
