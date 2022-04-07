<?php 
include_once "auth_con.php";
$q="SELECT * FROM `user`";
$query ="INSERT INTO`user`VALUES('".$_POST['login']."','".$_POST['password']."','".$_POST['passport_number']."','".$_POST['FIO']."','".$_POST['telephone']."','".$_POST['access']."','".$_POST['hotel']."')";
$result = mysqli_query($conn,$query);
$error=mysqli_error($conn);
if ($error!=Null)
	echo '<script>alert("Следует учесть: '.$error.'");</script>';
include_once "index.php";
?>