<?php
$server = "localhost";
$username = "root";
$password = "";
$db = "hackathon";
$mysqli = mysqli_connect($server, $username, $password, $db);
mysqli_set_charset($mysqli,"utf8");

global $mysqli;

if (isset($_GET['id']) && isset($_GET['answer']))
{
    $id=$_GET['id'];
    $answer=$_GET['answer'];

    $query = "SELECT image FROM erreur";
    if($id != 0)
    {
        $query .= " NATURAL JOIN elementerreur WHERE idElement=".$id." and RepDeclencheur='".$answer."'";
    }

    $response = array();
    $result = mysqli_query($mysqli, $query);
    while($row = mysqli_fetch_array($result))
    {
        $response = $row;
    }
    header('Content-Type: application/json');
    echo json_encode($response, JSON_PRETTY_PRINT);
}