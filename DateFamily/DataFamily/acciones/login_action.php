<?php
session_start();
require_once '../configuracion/db.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header("Location: ../vistas/login.html");
    exit();
}

$usuario    = trim($_POST['usuario']);
$contraseña = $_POST['contraseña'];

if (empty($usuario) || empty($contraseña)) {
    header("Location: ../vistas/login.html?error=1");
    exit();
}

$consulta = $conexion->prepare("SELECT id, contraseña, rol FROM usuarios WHERE usuario = ?");
$consulta->bind_param("s", $usuario);
$consulta->execute();
$resultado = $consulta->get_result();

if ($resultado->num_rows === 0) {
    header("Location: ../vistas/login.html?error=1");
    exit();
}

$fila = $resultado->fetch_assoc();

if (!password_verify($contraseña, $fila['contraseña'])) {
    header("Location: ../vistas/login.html?error=1");
    exit();
}

$_SESSION['usuario_id'] = $fila['id'];
$_SESSION['rol']        = $fila['rol'];

header("Location: ../index.php");
exit();