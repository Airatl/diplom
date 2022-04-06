<html>
<?php include_once "part_header.php"?>
<?php include_once "part_main.php"?>

<div>   
<?PHP

$result=$conn->query("SELECT*FROM `user_v`",MYSQLI_USE_RESULT);
		echo "<table>";
		while($row = mysqli_fetch_assoc($result))
		{
			if(!$x)
			{
				echo "<tr>";
				foreach ($row as $key => $value)
					echo "<th>$key</th>";
				echo "</tr>";
				$x=true;
			}
			echo "<tr>";
			foreach ($row as $key => $value)
				echo "<td>$value</td>";
			echo "</tr>";
		}
		echo "</table>";

?></div>

</script>
<form action="query_red.php" method="post">
<div class=col><label>Логин:					</label><br><input type="text"name="login"></div>
<div class=col><label>Новый логин:	</label><br><input type="text"name="newlogin"></div>
<div class=col><label>Пароль:				</label><br><input type="password"name="password"></div>
<div class=col><label>Номер паспорта:</label><br><input type="text"name="passport_number"></div>
<div class=col><label>ФИО:					</label><br><input type="text"name="FIO"></div>
<div class=col><label>Телефон:			</label><br><input type="text"name="telephone"></div>
<div class=col><label>Статус:					</label><br><input type="text"name="access"></div>
<div class=col><label>Отель:					</label><br><input type="text"name="hotel"></div><br><br><br><br><br>
<input type="submit"name="submit"></form>
</html>
