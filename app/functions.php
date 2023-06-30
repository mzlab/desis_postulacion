<?php
    require_once "../database/db_connection.php";

    //Recibe una query y devuelve todos los datos en formato JSON
    function listAll($query) {
        try {
            $conn = obtenerConexion(); // Obtener la conexión desde db_connection.php

            $stmt = $conn->prepare($query);
            $stmt->execute();
            $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);

            // Convertir los datos en formato JSON
            $resultados_json = json_encode($resultados);

            // Cerrar la conexión con la base de datos
            $conn = null;

            return $resultados_json;

        } catch (PDOException $e) {
            die("Error al ejecutar la consulta: " . $e->getMessage());
        }
    }
?>