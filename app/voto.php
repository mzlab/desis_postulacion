<?php
    require_once "../database/db_connection.php";

    // Obtener los datos JSON enviados desde JavaScript
    $jsonData = file_get_contents('php://input');
    $voto = json_decode($jsonData);

    // Obtener los datos individuales del voto
    $nombre = $voto->nombre_completo;
    $alias = $voto->alias;
    $rut = $voto->rut;
    $email = $voto->email;
    $regionId = $voto->region;
    $comunaId = $voto->comuna;
    $candidatoId = $voto->candidato;
    $referencia = $voto->referencia;

    try {
        $conn = obtenerConexion(); // Obtener la conexión desde db_connection.php

        //Consulta preparada 
        $stmt = $conn->prepare('INSERT INTO voto (nombre_completo, alias, rut, email, id_re, id_co, id_candidato) VALUES (?, ?, ?, ?, ?, ?, ?)');
        $stmt->bindParam(1, $nombre);
        $stmt->bindParam(2, $alias);
        $stmt->bindParam(3, $rut);
        $stmt->bindParam(4, $email);
        $stmt->bindParam(5, $regionId);
        $stmt->bindParam(6, $comunaId);
        $stmt->bindParam(7, $candidatoId);

        //Inserción de datos
        $stmt->execute();
    
        $idVoto = $conn->lastInsertId(); // Obtener el ID del voto insertado
    
        // Guardar las opciones seleccionadas en la tabla de relación 'voto_fuente_ref'
        foreach ($referencia as $opcionId) {
            //Consulta preparada 
            $stmt = $conn->prepare('INSERT INTO voto_fuente_ref (id_voto, id_fuente_ref) VALUES (?, ?)');
            $stmt->bindParam(1, $idVoto);
            $stmt->bindParam(2, $opcionId);

            //Inserción de datos
            $stmt->execute();
        }
    
    } catch (PDOException $e) {
        die("Error al ejecutar la consulta: " . $e->getMessage());
    }

?>