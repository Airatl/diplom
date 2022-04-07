<html>
<body>
<?php 
include_once "part_header.php"?>
<div style="padding=1%;">
<?PHP
$log=$_POST['name'];
$pass=$_POST['password'];
$query ="SELECT*FROM `user` where `user`.`login`='".$log."' and `user`.`password`='".$pass."'";
$result= mysqli_fetch_assoc(mysqli_query($conn,$query));
$x=false;
if($result)
{
	if($result['access']=="admin")
	{
		echo "<input type='hidden'name='logo' value='logo'>";
		include_once "admin_red.php";
	}
	else echo '<script>alert("Ошибка, доступ не админ");</script>';
}
else 
{
	echo '<script>alert("Ошибка, такого пользователя не существует");</script>';
	include_once"index.php";
}
?>
</div>
</body>
</html>
