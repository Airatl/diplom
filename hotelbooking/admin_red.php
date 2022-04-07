<html>
<div>
<?
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

<form action="query_red.php" method="post">
<div class=col><label>Логин:					</label><br><input type="text"name="Логин"></div>
<div class=col><label>Новый логин:		</label><br><input type="text"name="Новый"></div>
<div class=col><label>Пароль:				</label><br><input type="password"name="Пароль"></div>
<div class=col><label>Номер паспорта:	</label><br><input type="text"name="Номер"></div>
<div class=col><label>ФИО:					</label><br><input type="text"name="ФИО"></div>
<div class=col><label>Телефон:				</label><br><input type="text"name="Телефон"></div>
<div class=col><label>Статус:					</label><br><input type="text"name="Статус"></div>
<div class=col><label>Отель:					</label><br><input type="text"name="Отель"></div>
<input type="hidden"name="name" value="<?print_r($_POST['name'])?>">
<input type="hidden"name="password" value="<?print_r($_POST['password'])?>">

<input id="commit"style="margin-right:70%"type="submit" name="submit">

</form>
</html>
