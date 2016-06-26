<?php   
include("dbconnect.php"); 
$email = $_POST['email'];   
$password = $_POST['password']; 
$login = mysql_query("SELECT * FROM Users WHERE email = '$email' AND password = '$password'") or die("Erro ao fazer login!");
if(strlen($password)<1) echo "Erro ao fazer login!";
elseif (mysql_num_rows($login)>0) { echo "entrou"; } else { echo "error"; }
?>