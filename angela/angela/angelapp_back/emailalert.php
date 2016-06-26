<?php   
include("dbconnect.php"); 

$userEmail = $_POST['userEmail'];

$status = 'started';

// procura na tabela EventStatus o eventId com status STARTED do userEmail fornecido

$geteventid = mysql_query("SELECT eventId FROM EventStatus WHERE userEmail = '$userEmail' AND status = '$status'") or die("Ocorreu um erro!");

while($row = mysql_fetch_array($geteventid)) {
    //echo $row['eventId'];
    $eventId = $row['eventId'];
}

// com o eventId, procura na tabela Events os dados dos contatos daquele usuário 
// como estamos fazendo um MVP, será somente 01 contato

$geteventcontacts = mysql_query("SELECT contacts FROM Events WHERE eventId = '$eventId'") or die("Ocorreu um erro!");

$geteventaddress = mysql_query("SELECT eventAddress FROM Events WHERE eventId = '$eventId'") or die("Ocorreu um erro!");

$getname = mysql_query("SELECT name FROM Users WHERE email = '$userEmail'") or die("deu erro");

while($row = mysql_fetch_array($geteventcontacts)) {
   //echo $row['contacts']; 
   $emailAddress =  $row['contacts'];
}

while($row = mysql_fetch_array($geteventaddress)) {
    //echo $row['eventAddress']; 
   $eventAddress =  $row['eventAddress'];
}

while($row = mysql_fetch_array($getname)) {
    //echo $row['name']; 
   $yourFriend =  $row['name'];
}

// envia o email e também manda uma cópia pra gente

$to = $emailAddress . ", teste@projetotutoras.com";
$subject = $yourFriend . " precisa de ajuda!";
$message = $yourFriend . " encontra-se em " . $eventAddress;
$headers = 'From: noreply@angela.app';

mail($to, $subject, $message, $headers);

// para o evento

$status = 'stopped';

$stopevent = mysql_query("INSERT INTO `EventStatus`(`eventId`, `userEmail`, `status`) VALUES ('$myEventId', '$userEmail', '$status')") or die(mysql_error());  

echo "sent"; 

?>