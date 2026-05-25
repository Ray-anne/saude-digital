<%@ page import="model.Paciente" %>
<%@ page import="dao.PacienteDAO" %>

<%

int id =
Integer.parseInt(
request.getParameter("id"));

PacienteDAO dao =
new PacienteDAO();

Paciente paciente =
dao.buscarPacientePorId(id);

%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Editar Paciente</title>

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

h2{

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

<h2>Editar Paciente</h2>

<form action="AtualizarPacienteServlet"
method="post">

<input type="hidden"
name="id"
value="<%= paciente.getId() %>">

<input type="text"
name="nome"
value="<%= paciente.getNome() %>"
required>

<input type="number"
name="idade"
value="<%= paciente.getIdade() %>"
required>

<input type="text"
name="telefone"
value="<%= paciente.getTelefone() %>"
required>

<input type="text"
name="cpf"
value="<%= paciente.getCpf() %>"
required>

<button type="submit">

Salvar Alterações

</button>

</form>

</div>

</body>
</html>