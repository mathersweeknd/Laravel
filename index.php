<?php
if(isset($_POST['email'])) {

    include( 'config.php');

    $email = $_POST['email'];
    $senha = password_hash($_POST['senha'], PASSWORD_DEFAULT);

    $mysqli->query("INSERT INTO catalogo_midia (email, senha) VALUES ('$email', '$senha')");
}

?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Acervo | CDs e Livros</title>
    <link rel="icon" href="img/icon.png">
    <style>
        body{
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(to left, #0099cc 0%, #993399 60%);
            text-align: center;
            color: white;
        }
        .box{
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            background-color: rgba(0, 0, 0, 0.6);
            padding: 30px;
            border-radius: 10px;
        }
        a{
            text-decoration: none;
            color: white;
            border: 3px solid dodgerblue;
            border-radius: 10px;
            padding: 10px;
        }
        a:hover{
            background-color: dodgerblue;
        }
    </style>
</head>

<body>
    <h1>Seja bem-vindo</h1>
    <h2>Acervo de Livros e CDs</h2>
    <div class="box">
        <a href="login.php">Login</a>
        <a href="formulario.php">Cadastre-se</a>
    </div>
</body>
</html>

