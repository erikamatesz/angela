<?php   
include("dbconnect.php");   

$eventName = $_POST['eventName'];   
$eventAddress = $_POST['eventAddress'];   
$startTime = $_POST['startTime'];   
$endTime = $_POST['endTime'];
$frequency = $_POST['frequency']; 
$contacts = $_POST['contacts'];
$friends = $_POST['friends'];
$userEmail = $_POST['userEmail'];  
$userEmail2 = $_POST['userEmail'];  

// insere um evento na tabela Events

$insertdata = mysql_query("INSERT INTO `Events`(`eventName`,`eventAddress`,`startTime`,`endTime`,`frequency`,`contacts`,`friends`,`userEmail`) VALUES ('$eventName', '$eventAddress', '$startTime',
'$endTime', '$frequency', '$contacts', '$friends', '$userEmail')") or die(mysql_error());  

// nos fornece o id do evento criado

$geteventid = mysql_query("SELECT eventId FROM Events WHERE userEmail = '$userEmail'") or die("Ocorreu um erro.");

while($row = mysql_fetch_array($geteventid)) {
    //echo $row['eventId']; 
   $myEventId =  $row['eventId'];
}

// muda o status do evento para started e o insere em uma tabela de Eventos relacionados a um usuário

$status = 'started';

$insertdata2 = mysql_query("INSERT INTO `EventStatus`(`eventId`, `userEmail`, `status`) VALUES ('$myEventId', '$userEmail2', '$status')") or die(mysql_error());  

if ($insertdata2) 
	echo "eventcreated"; 
else
	echo "error"; 
	
?>