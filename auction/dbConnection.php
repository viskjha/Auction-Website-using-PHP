<?php
//global $dsn, $db_user,$db_pass, $db;
$dsn = 'mysql:host=localhost;dbname=auction';
$db_user = 'root';
$db_pass = '';

try{
    $db = new PDO($dsn, $db_user, $db_pass);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch (PDOException $e){
    echo "Error: " . $e->getMessage();
}