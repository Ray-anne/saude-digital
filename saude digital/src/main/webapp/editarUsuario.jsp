<%@ page import="dao.UsuarioDAO" %>
<%@ page import="model.Usuario" %>

<%

int id =
Integer.parseInt(
request.getParameter("id"));

UsuarioDAO dao =
new UsuarioDAO();

Usuario usuario =
dao.buscarUsuarioPorId(id);

%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Editar Usuário</title>

<style>

body{

    font-family:Arial;

    background:linear-gradient(
    to right,
    #1d5fa2,
    #28d7f7);

    display:flex;

    justify-content:center;

    align-items:center;

    height:100vh;
}

.container{

    width:400px;

    background:white;

    padding:30px;

    border-radius:20px;

    box-shadow:0px 8px 20px rgba(0,0,0,0.2);
}

h1{

    text-align:center;

    color:#1d5fa2;

    margin-bottom:25px;
}

input{

    width:100%;

    padding:12px;

    margin-bottom:15px;

    border-radius:10px;

    border:1px solid #ccc;
}

button{

    width:100%;

    padding:14px;

    border:none;

    border-radius:10px;

    background:#1d5fa2;

    color:white;

    font-size:16px;

    font-weight:bold;

    cursor:pointer;
}

</style>

</head>

<body>

<div class="container">

<h1>Editar Usuário</h1>

<form action="AtualizarUsuarioServlet"
method="post">

<input
type="hidden"
name="id"
value="<%= usuario.getId() %>">

<input
type="email"
name="email"
value="<%= usuario.getEmail() %>"
required>

<input
type="text"
name="senha"
value="<%= usuario.getSenha() %>"
required>

<button type="submit">

Atualizar

</button>

</form>

</div>

</body>

</html>