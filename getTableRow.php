<?php
		$table =$_POST['table'];
			
			$link = mysqli_connect("localhost", "root", "", "demo2300");
			if($link)
			{

						$query = "SELECT * FROM ". $table;
						$rowCount = mysqli_query($link, $query);
						$rows = mysqli_num_rows($rowCount);
						echo $rows;

			}
			

?>