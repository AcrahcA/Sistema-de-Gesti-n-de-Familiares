<?php
session_start();
require_once '../configuracion/db.php';

if (!isset($_SESSION['usuario_id'])) {
    header("Location: ../vistas/login.html");
    exit();
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header("Location: ../vistas/familiares.html");
    exit();
}

$nombre        = trim($_POST['nombre']);
$parentesco_id = trim($_POST['parentesco_id']);
$edad          = trim($_POST['edad']);
$usuario_id    = $_SESSION['usuario_id'];

if (empty($nombre) || empty($parentesco_id) || empty($edad)) {
    header("Location: ../vistas/familiares.html?error=1");
    exit();
}

if (!is_numeric($edad) || !is_numeric($parentesco_id)) {
    header("Location: ../vistas/familiares.html?error=1");
    exit();
}

$consulta = $conexion->prepare("INSERT INTO familias (nombre, edad, parentesco_id, usuario_id) VALUES (?, ?, ?, ?)");
$consulta->bind_param("siii", $nombre, $edad, $parentesco_id, $usuario_id);
$consulta->execute();

header("Location: ../vistas/familiares.html?exito=1");
exit();