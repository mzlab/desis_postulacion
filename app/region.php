<?php
    require_once "functions.php";

    $query = "SELECT id_re, str_descripcion FROM region";
    $lista_regiones = listAll($query);

    //Devuelve todos las regiones en formato JSON
    echo $lista_regiones;
?>