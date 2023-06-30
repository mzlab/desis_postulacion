<?php
    require_once "functions.php";

    $query = "SELECT id_co, id_re, str_descripcion FROM comuna";
    $lista_comunas = listAll($query);

    //Devuelve todas las comunas en formato JSON
    echo $lista_comunas;
?>