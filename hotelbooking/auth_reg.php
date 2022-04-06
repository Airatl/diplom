<html>
<link href = "s.css" rel="stylesheet">
<?php include_once "part_header.php"?>
<?php include_once "part_main.php"?>
<?php include_once "part_leftmenu.php"?>

<div class="c"><form action="query_reg.php" method="post">

<label>Логин:					</label><br><input type="text"name="login"><br>
<label>Пароль:				</label><br><input type="password"name="password"><br>
<label>Номер паспорта:</label><br><input type="text"name="passport_number"><br>
<label>ФИО:					</label><br><input type="text"name="FIO"><br>
<label>Телефон:			</label><br><input type="text"name="telephone"><br>
<label>Статус:					</label><br><input type="text"name="access"><br>
<label>Отель:					</label><br><input type="text"name="hotel"><br>
<input type="submit"name="submit">

</form></div>

<?php include_once "part_footer.php"?>
</html>