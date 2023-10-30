<?php
require 'config.php';
$conectar = new mysqli($servidor,$usuario,$password,$basededatos);
if($conectar->connect_error){
	echo "No se conecto la base de datos";
}else{
	//echo "Conectado a la base de datos";
}

?>