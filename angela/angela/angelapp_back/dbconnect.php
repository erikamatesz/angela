<?php 
$host = "mysql.hostinger.com.br";
$user = "u226847001_app"; 
$pwrd = "angelhackrio2016";
$dbname = "u226847001_angel";

mysql_connect($host, $user, $pwrd) or die("Oops! Ocorreu um erro!");
mysql_select_db($dbname) or die("Oops! Ocorreu um erro!");

?>