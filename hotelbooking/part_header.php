<head>
<link href = "s.css" rel="stylesheet">
<?php include_once "auth_con.php"?>
</head>
<div class = "h">
<?
if (!array_keys($_POST))
{
echo '
<div class = "log"><form action="auth_log.php" method="post">

<label>Логин:</label><br>	<input type="text" name="name" placeholder="Введите ваш логин"><br>
<label>Пароль:</label><br>	<input type="password" name="password" placeholder="123123"><br>

<input type="submit" name="submit" value="Войти">
<button formaction="auth_reg.php">Регистрация</button>

</form></div>';
}
else
	echo "<from style='float:right'align='right'>Логин:<br>".$_POST['name']."</from>";
?>
</div>
</head>