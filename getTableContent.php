<?php
		$table =$_POST['table'];
;
			$link = mysqli_connect("localhost", "root", "", "demo2300");
			if($link)
			{
				$content = "";
				$rowfetcher ="";
				$count = 0;
				$sql = "SELECT * FROM " . $table;
				$result = mysqli_query($link, $sql);
				while($row = mysqli_fetch_assoc($result))
				{
					foreach ($row as $value)
					{
						$content .=  $value.", ";
					}
					
					$content .=  "^";
				}

				echo $content;
				
			}
			

?>