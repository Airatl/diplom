<html>
<?php include_once "part_header.php"?>
<?php include_once "part_main.php"?>
<?php include_once "part_leftmenu.php"?>

<div><?PHP

$result=$conn->query("SELECT*FROM `user_v`",MYSQLI_USE_RESULT);
		echo "<table>";
		while($row = mysqli_fetch_assoc($result))
		{
			if(!$x)
			{
				echo "<tr>";
				foreach ($row as $key => $value)
					echo "<td><b>$key</b></td>";
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

<?php include_once "part_footer.php"?>
</html>
