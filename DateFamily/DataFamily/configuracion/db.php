<?php
$host     = "localhost";
$bd       = "family";
$usuario  = "root";
$password = "";

$conexion = new mysqli($host, $usuario, $password, $bd);

if ($conexion->connect_error) {
    die("Error al conectar con la base de datos: " . $conexion->connect_error);
}