<?php
//Crear base de datos test_docker
$conn = pg_connect("host=172.17.0.2 port=5432 dbname=test_docker user=test password=test");
if (!$conn) {
  echo "Ocurrio un error al conectar a la base de datos";
  exit;
}

$pid = pg_get_pid($conn);
echo "ProcessId de Conexion: ".$pid;

?>

