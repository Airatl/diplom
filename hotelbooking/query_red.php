<?php 
include_once "auth_con.php";
$q="SELECT * FROM `user`";
print_r($_POST['newlogin']);
$yes=false;
if($_POST['newlogin'] and $_POST['login'])
{
	$query ="update `user`set  `login`='".$_POST['newlogin']."' where '".$_POST['login']."'=`user`.`login`";
	$result = mysqli_query($conn,$query);
	$yes=true;
}
if($_POST['password'] and $_POST['login'])
{
	$query ="update `user`set  `password`='".$_POST['password']."' where '".$_POST['login']."'=`user`.`login`";
	$result = mysqli_query($conn,$query);
	$yes=true;
}
if($_POST['passport_number'] and $_POST['login'])
{
	$query ="update `user`set  `passport_number`='".$_POST['passport_number']."' where '".$_POST['login']."'=`user`.`login`";
	$result = mysqli_query($conn,$query);
	$yes=true;
}
if($_POST['FIO'] and $_POST['login'])
{
	$query ="update `user`set  `FIO`='".$_POST['FIO']."' where '".$_POST['login']."'=`user`.`login`";
	$result = mysqli_query($conn,$query);
	$yes=true;
}
if($_POST['telephone'] and $_POST['login'])
{
	$query ="update `user`set  `telephone`='".$_POST['telephone']."' where '".$_POST['login']."'=`user`.`login`";
	$result = mysqli_query($conn,$query);
	$yes=true;
}
if($_POST['access'] and $_POST['login'])
{
	$query ="update `user`set  `access`='".$_POST['access']."' where '".$_POST['login']."'=`user`.`login`";
	$result = mysqli_query($conn,$query);
	$yes=true;
}
if($_POST['hotel'] and $_POST['login'])
{
	$query ="update `user`set  `hotel`='".$_POST['hotel']."' where '".$_POST['login']."'=`user`.`login`";
	$result = mysqli_query($conn,$query);
	$yes=true;
}

if ($yes)
	include_once("auth_log.php");
else
	echo '<script>alert("Изменений нет");</script>';
?>