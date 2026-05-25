<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="pt-br">

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title>Cadastro de Pacientes</title>

<style>

body{

    margin:0;

    padding:0;

    font-family:Arial, Helvetica, sans-serif;

    background:linear-gradient(
    to right,
    #1d5fa2,
    #28d7f7);

    height:100vh;

    display:flex;

    justify-content:center;

    align-items:center;
}

.container{

    width:420px;

    background:white;

    padding:35px;

    border-radius:20px;

    box-shadow:0px 8px 20px rgba(0,0,0,0.2);
}

h1{

    text-align:center;

    color:#1d5fa2;

    margin-bottom:30px;
}

input{

    width:100%;

    padding:14px;

    margin-bottom:18px;

    border-radius:10px;

    border:1px solid #ccc;

    font-size:15px;

    box-sizing:border-box;
}

button{

    width:100%;

    padding:15px;

    border:none;

    border-radius:10px;

    background:#1d5fa2;

    color:white;

    font-size:16px;

    font-weight:bold;

    cursor:pointer;

    transition:0.3s;
}

button:hover{

    background:#174c82;
}

.voltar{

    background:#555;

    margin-top:10px;
}

.voltar:hover{

    background:#333;
}

</style>

</head>

<body>

<div class="container">

<h1>Cadastro de Pacientes</h1>

<form action="CadastroPacienteServlet"
method="post">

<!-- NOME -->

<input
type="text"
name="nome"
placeholder="Nome do paciente"
required>

<!-- IDADE -->

<input
type="number"
name="idade"
placeholder="Idade"
min="0"
max="100"
step="1"
required>

<!-- TELEFONE -->

<input
type="text"
id="telefone"
name="telefone"
placeholder="(85)99999-9999"
maxlength="14"
required>

<!-- CPF -->

<input
type="text"
id="cpf"
name="cpf"
placeholder="000.000.000-00"
maxlength="14"
required>

<button type="submit">

Cadastrar Paciente

</button>

</form>

<a href="home.html">

<button class="voltar">

Voltar ao Menu

</button>

</a>

</div>

<!-- SCRIPT -->

<script>

/* MÁSCARA CPF */

document
.getElementById('cpf')

.addEventListener('input', function(e){

    let value =
    e.target.value
    .replace(/\D/g,'');

    value =
    value.replace(
    /(\d{3})(\d)/,
    '$1.$2'
    );

    value =
    value.replace(
    /(\d{3})(\d)/,
    '$1.$2'
    );

    value =
    value.replace(
    /(\d{3})(\d{1,2})$/,
    '$1-$2'
    );

    e.target.value =
    value;
});

/* MÁSCARA TELEFONE */

document
.getElementById('telefone')

.addEventListener('input', function(e){

    let value =
    e.target.value
    .replace(/\D/g,'');

    value =
    value.replace(
    /^(\d{2})(\d)/g,
    '($1)$2'
    );

    value =
    value.replace(
    /(\d{5})(\d)/,
    '$1-$2'
    );

    e.target.value =
    value;
});

/* VALIDAÇÃO */

document.querySelector("form")

.addEventListener("submit",
function(event){

    let cpf =
    document
    .getElementById("cpf")
    .value
    .replace(/\D/g,'');

    let telefone =
    document
    .getElementById("telefone")
    .value
    .replace(/\D/g,'');

    let idade =
    document
    .querySelector(
    'input[name="idade"]')
    .value;

    /* CPF */

    if(cpf.length != 11){

        alert(
        "CPF deve conter exatamente 11 números!"
        );

        event.preventDefault();

        return;
    }

    /* TELEFONE */

    if(telefone.length != 11){

        alert(
        "Telefone deve conter exatamente 11 números!"
        );

        event.preventDefault();

        return;
    }

    /* IDADE */

    if(idade < 0 || idade > 100){

        alert(
        "Idade inválida! Digite entre 0 e 100 anos."
        );

        event.preventDefault();

        return;
    }
});

</script>

</body>

</html>