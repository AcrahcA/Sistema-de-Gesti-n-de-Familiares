<?php
session_start();
require_once '../configuracion/db.php';

if (!isset($_SESSION['usuario_id'])) {
    echo json_encode([]);
    exit();
}

$resultado = $conexion->query("SELECT id, descripcion FROM parentesco");
$datos = [];

while ($fila = $resultado->fetch_assoc()) {
    $datos[] = $fila;
}

header('Content-Type: application/json');
echo json_encode($datos);