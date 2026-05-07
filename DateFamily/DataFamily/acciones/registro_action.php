<?php
session_start();
require_once '../configuracion/db.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header("Location: ../vistas/registro.html");
    exit();
}

$usuario    = trim($_POST['usuario']);
$contraseña = $_POST['contraseña'];

if (empty($usuario) || empty($contraseña)) {
    header("Location: ../vistas/registro.html?error=2");
    exit();
}

$consulta = $conexion->prepare("SELECT id FROM usuarios WHERE usuario = ?");
$consulta->bind_param("s", $usuario);
$consulta->execute();
$resultado = $consulta->get_result();

if ($resultado->num_rows > 0) {
    header("Location: ../vistas/registro.html?error=1");
    exit();
}

$contraseña_encriptada = password_hash($contraseña, PASSWORD_DEFAULT);

$insertar = $conexion->prepare("INSERT INTO usuarios (usuario, contraseña) VALUES (?, ?)");
$insertar->bind_param("ss", $usuario, $contraseña_encriptada);
$insertar->execute();

header("Location: ../vistas/login.html?registro=1");
exit();