<?php
		$table =$_POST['table'];
			
			$link = mysqli_connect("localhost", "root", "", "demo2300");
			if($link)
			{
				$headernames = "";

				
				$sql = "SHOW COLUMNS FROM "  . $table;
				$result = mysqli_query($link, $sql);
				$index = 0;
				while($row = mysqli_fetch_array($result)){
					if($index == 0)
					{
						$headernames .=  $row['Field'];
						$index++;
					}
					else
					{
						$headernames .=  ", ".$row['Field'];
					}
				}
				
				echo $headernames;
				
			}
			

?>