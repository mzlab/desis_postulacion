<?php
    require_once "functions.php";

    $query = "SELECT id_candidato, nombre_completo FROM candidato";
    $lista_candidatos = listAll($query);

    //Devuelve todos los candidatos en formato JSON
    echo $lista_candidatos;
?>