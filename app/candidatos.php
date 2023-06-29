<?php
    require_once "../database/db_connection.php";

    try {
        // Consulta para obtener datos de region
        $query_candidatos = "SELECT id_candidato, nombre_completo FROM candidato";
        $stmt_candidatos = $conn->prepare($query_candidatos);
        $stmt_candidatos->execute();
        $reg_candidatos = $stmt_candidatos->fetchAll(PDO::FETCH_ASSOC);

        // Convertir los datos en formato JSON
        $reg_candidatos = json_encode($reg_candidatos);

        echo $reg_candidatos;

    } catch (PDOException $e) {
        die("Error al ejecutar la consulta: " . $e->getMessage());
    }
    
    // Cerrar la conexión con la base de datos
    $conn = null;

?>