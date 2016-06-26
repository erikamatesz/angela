<?php   
include("dbconnect.php");   

$name = $_POST['name'];   
$email = $_POST['email'];   
$password = $_POST['password'];   
$emergpass = $_POST['emergpass'];
$mobile = $_POST['mobile'];   

$insertdata = mysql_query("INSERT INTO `Users`(`name`, `email`, `password`, `emergpass`, `mobile`) VALUES ('$name', '$email', '$password','$emergpass', '$mobile')") or die(mysql_error());  

if ($insertdata) 
	echo "created"; 
else
	echo "error"; 
	
?>