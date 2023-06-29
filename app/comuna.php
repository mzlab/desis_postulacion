<?php
    require_once "../database/db_connection.php";

    try {
        // Consulta para obtener datos de comuna
        $query_comunas = "SELECT id_co, id_re, str_descripcion FROM comuna";
        $stmt_comunas = $conn->prepare($query_comunas);
        $stmt_comunas->execute();
        $reg_comunas = $stmt_comunas->fetchAll(PDO::FETCH_ASSOC);

        // Convertir los datos en formato JSON
        $reg_comunas_json = json_encode($reg_comunas);

        echo $reg_comunas_json;

    } catch (PDOException $e) {
        die("Error al ejecutar la consulta: " . $e->getMessage());
    }
    
    // Cerrar la conexión con la base de datos
    $conn = null;

?>