<?php
    require_once "../database/db_connection.php";

    try {
        // Consulta para obtener datos de region
        $query_regiones = "SELECT id_re, str_descripcion FROM region";
        $stmt_regiones = $conn->prepare($query_regiones);
        $stmt_regiones->execute();
        $reg_regiones = $stmt_regiones->fetchAll(PDO::FETCH_ASSOC);

        // Convertir los datos en formato JSON
        $reg_regiones_json = json_encode($reg_regiones);

        echo $reg_regiones_json;

    } catch (PDOException $e) {
        die("Error al ejecutar la consulta: " . $e->getMessage());
    }
    
    // Cerrar la conexión con la base de datos
    $conn = null;

?>