<?php 
include_once "auth_con.php";
$q="SELECT * FROM `user`";
$yes=false;
if($_POST['Пароль'] and $_POST['Логин'])
{
	$query ="update `user`set  `password`='".$_POST['Пароль']."' where '".$_POST['Логин']."'=`user`.`login`";
	$result = mysqli_query($conn,$query);
	$yes=true;
}
if($_POST['Номер'] and $_POST['Логин'])
{
	$query ="update `user`set  `passport_number`='".$_POST['Номер']."' where '".$_POST['Логин']."'=`user`.`login`";
	$result = mysqli_query($conn,$query);
	$yes=true;
}
if($_POST['ФИО'] and $_POST['Логин'])
{
	$query ="update `user`set  `FIO`='".$_POST['ФИО']."' where '".$_POST['Логин']."'=`user`.`login`";
	$result = mysqli_query($conn,$query);
	$yes=true;
}
if($_POST['Телефон'] and $_POST['Логин'])
{
	$query ="update `user`set  `telephone`='".$_POST['Телефон']."' where '".$_POST['Логин']."'=`user`.`login`";
	$result = mysqli_query($conn,$query);
	$yes=true;
}
if($_POST['Статус'] and $_POST['Логин'])
{
	$query ="update `user`set  `access`='".$_POST['Статус']."' where '".$_POST['Логин']."'=`user`.`login`";
	$result = mysqli_query($conn,$query);
	$yes=true;
}
if($_POST['Отель'] and $_POST['Логин'])
{
	$query ="update `user`set  `hotel`='".$_POST['Отель']."' where '".$_POST['Логин']."'=`user`.`login`";
	$result = mysqli_query($conn,$query);
	$yes=true;
}
if($_POST['Новый'] and $_POST['Логин'])
{
	$query ="update `user`set  `login`='".$_POST['Новый']."' where '".$_POST['Логин']."'=`user`.`login`";
	$result = mysqli_query($conn,$query);
	$yes=true;
}

if ($yes)
{
	echo "<input type='hidden'name='name' value='".$_POST['name']."'><input type='hidden'name='password' value='".$_POST['password']."'>";
	include_once("auth_log.php");
}
else
	echo '<script>alert("Изменений нет");</script>';
?>