<?php
    require_once "functions.php";

    $query = "SELECT rut FROM voto";
    $lista_rut = listAll($query);

    //Devuelve todas los RUT desde la tabla voto en formato JSON
    echo $lista_rut;
?>