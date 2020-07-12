<?php
$img=file('pic.txt');
$url=array_rand($img);
header("Location:".$img[$url]);
?>