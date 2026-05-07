<?php
session_start();
require_once '../configuracion/db.php';

if (!isset($_SESSION['usuario_id'])) {
    header("Location: ../vistas/login.html");
    exit();
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header("Location: ../vistas/perfil.html");
    exit();
}

$nombre   = trim($_POST['nombre']);
$dni      = trim($_POST['dni']);
$telefono = trim($_POST['telefono']);

if (empty($nombre) || empty($dni) || empty($telefono)) {
    header("Location: ../vistas/perfil.html?error=1");
    exit();
}

if (!is_numeric($dni)) {
    header("Location: ../vistas/perfil.html?error=1");
    exit();
}

if (!is_numeric($telefono)) {
    header("Location: ../vistas/perfil.html?error=1");
    exit();
}

$id = $_SESSION['usuario_id'];

$consulta = $conexion->prepare("UPDATE usuarios SET nombre = ?, DNI = ?, telefono = ? WHERE id = ?");
$consulta->bind_param("ssii", $nombre, $dni, $telefono, $id);
$consulta->execute();

header("Location: ../vistas/perfil.html?exito=1");
exit(); 