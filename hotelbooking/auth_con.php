<?php 
$dbhost="localhost";
$dblogin = "root"; // ВАШ ЛОГИН К БАЗЕ ДАННЫХ
$dbpass = "root"; // ВАШ ПАРОЛЬ К БАЗЕ ДАННЫХ
$db = "hotel"; // НАЗВАНИЕ БАЗЫ ДЛЯ САЙТА
$conn=mysqli_connect($dbhost, $dblogin, $dbpass);
$select_db= mysqli_select_db($conn,$db);
echo mysqli_error($conn);
?>