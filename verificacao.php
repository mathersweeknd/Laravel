<?php

$servername = "localhost";
$username = "root";
$password = "sua_senha";
$dbname = "catalogo_midia";


$conn = new mysqli($servername, $username, $password, $dbname);


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

include 'config.php';

$nome_usuario = $_POST['nome_usuario'];
$senha = $_POST['senha'];


include 'config.php';

$nome_usuario = $_POST['nome_usuario'];
$senha = $_POST['senha'];


$sql = "SELECT * FROM usuarios WHERE nome_usuario = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param('s', $nome_usuario);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $usuario = $result->fetch_assoc();
    if (password_verify($senha, $usuario['senha'])) {
       
        session_start();
        $_SESSION['usuario_id'] = $usuario['id'];
        $_SESSION['papel'] = $usuario['papel'];
        echo "Login bem-sucedido!";
    } else {
        echo "Senha incorreta.";
    }
} else {
    echo "Usuário não encontrado.";
}

$stmt->close();
$conn->close();

$senha_hash = password_hash($senha, PASSWORD_BCRYPT); 
$papel = $_POST['papel'];


$sql = "INSERT INTO usuarios (nome_usuario, senha, papel) VALUES (?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param('sss', $nome_usuario, $senha_hash, $papel);

if ($stmt->execute()) {
    echo "Usuário cadastrado com sucesso!";
} else {
    echo "Erro: " . $stmt->error;
}

$stmt->close();
$conn->close();


