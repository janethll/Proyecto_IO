<?php
session_start();
if(isset($_SESSION['usuario'])){
  header("location: administrador/index.php");
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Proyecto de IO</title>
  <link href="assets/bootstrap/bootstrap-5.3.0-alpha1-dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-image: url("img/MisG.gif");
      background-repeat: no-repeat;
      background-size: cover;
      background-position: center;
      height: 100vh;
    }

    .container-fluid {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100%;
    }

    .card {
      border: none;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      background-color: rgba(255, 255, 255, 0.8);
      padding: 20px;
      text-align: center;
    }

    .card-img-top {
      border-top-left-radius: 10px;
      border-top-right-radius: 10px;
      height: 200px;
      object-fit: cover;
    }

    .card-title {
      font-size: 24px;
      font-weight: bold;
      margin-top: 20px;
    }

    .card-text {
      font-size: 16px;
      color: #6c757d;
    }

    .btn-primary {
      background-color: #007bff;
      border-color: #007bff;
    }

    .btn-primary:hover {
      background-color: #0069d9;
      border-color: #0062cc;
    }
  </style>
</head>

<body>

  <div class="container-fluid">
    <div class="row">
      <div class="col">
        <div class="card mx-auto" style="width: 18rem;">
          <img src="img/p1.png" class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">Iniciar Sesión</h5>
            <p class="card-text">falta solucionar.</p>
            <a href="loginr.php" class="btn btn-primary">Iniciar Sesión</a>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card mx-auto" style="width: 18rem;">
          <img src="img/p3.avif" class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">Registrarse</h5>
            <p class="card-text">falta solucionar.</p>
            <a href="registror.php" class="btn btn-primary">Registrarse</a>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>

</html>
 