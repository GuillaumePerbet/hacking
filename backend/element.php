<?php
$server = "localhost";
$username = "root";
$password = "";
$db = "hackathon";
$mysqli = mysqli_connect($server, $username, $password, $db);
mysqli_set_charset($mysqli,"utf8");

global $mysqli;

if (isset($_GET['id']))
{
    $id=$_GET['id'];
    if($id != 0)
    {
        $query = "SELECT * FROM element";
        $query .= " WHERE idElement=".$id." LIMIT 1";
    }
    $response = array();
    $result = mysqli_query($mysqli, $query);
    while($row = mysqli_fetch_assoc($result))
    {
        $response[] = $row;
    }
    echo json_encode($response[0], JSON_PRETTY_PRINT);
}