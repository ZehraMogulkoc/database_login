<?php 

include 'conn.php';

$username = mysqli_real_escape_string($connect, $_POST['username']) ;
$password = mysqli_real_escape_string($connect, $_POST['password']);
$mail = mysqli_real_escape_string($connect, $_POST['mail']) ;
$phone = mysqli_real_escape_string($connect, $_POST['phone']);	  
	 
$query = "INSERT INTO user (username,password,mail,phone) VALUES('$username','$password','$mail','$phone')";
$results = mysqli_query($connect, $query);
if($results>0)
{
   echo "user added to DB successfully";
}
 
?>
