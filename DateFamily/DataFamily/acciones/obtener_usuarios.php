<?php
session_start();
require_once '../configuracion/db.php';

if (!isset($_SESSION['usuario_id']) || $_SESSION['rol'] !== 'ADMIN') {
    echo json_encode([]);
    exit();
}

$resultado = $conexion->query("
    SELECT u.id, u.usuario, u.nombre, u.DNI,
           f.nombre AS familiar_nombre, f.edad, p.descripcion AS parentesco
    FROM usuarios u
    LEFT JOIN familias f ON f.usuario_id = u.id
    LEFT JOIN parentesco p ON p.id = f.parentesco_id
    WHERE u.rol = 'USUARIO'
    ORDER BY u.id
");

$usuarios = [];

while ($fila = $resultado->fetch_assoc()) {
    $id = $fila['id'];

    if (!isset($usuarios[$id])) {
        $usuarios[$id] = [
            'usuario'    => $fila['usuario'],
            'nombre'     => $fila['nombre'],
            'dni'        => $fila['DNI'],
            'familiares' => []
        ];
    }

    if ($fila['familiar_nombre']) {
        $usuarios[$id]['familiares'][] = [
            'nombre'     => $fila['familiar_nombre'],
            'edad'       => $fila['edad'],
            'parentesco' => $fila['parentesco']
        ];
    }
}

header('Content-Type: application/json');
echo json_encode(array_values($usuarios));