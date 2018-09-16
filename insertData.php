<?php
		$table =$_POST['table'];
		$colcount = $_POST['cols'];
		$val1 = $_POST['val1'];
		$val2 = $_POST['val2'];
		$val3 = $_POST['val3'];
		$val4 = $_POST['val4'];
		$val5 = $_POST['val5'];
		$val6 = $_POST['val6'];
		$vals = array($val1,$val2,$val3,$val4,$val5,$val6);
			
			$link = mysqli_connect("localhost", "root", "", "demo2300");
			if($link)
			{
				
				$sql = "INSERT into ".$table." VALUES (\"";
				$x = 0;

				while ($x <= ($colcount-2)) {
				$sql .= $vals[$x]."\",\""; 
				$x += 1;				
				}
				$sql .= $vals[$x]."\")" ;
				$result = mysqli_query($link, $sql);
				echo $sql;
			}
			

?>