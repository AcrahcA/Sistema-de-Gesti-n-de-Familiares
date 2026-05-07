<?php
session_start();

if (!isset($_SESSION['usuario_id'])) {
    header("Location: vistas/login.html");
    exit();
}

if ($_SESSION['rol'] === 'ADMIN') {
    header("Location: vistas/admin.html");
    exit();
}

header("Location: vistas/perfil.html");
exit();