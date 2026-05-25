<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="model.*" %>

<%

ArrayList<Paciente> listaPacientes =
(ArrayList<Paciente>)
request.getAttribute("listaPacientes");

%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Relatório de Pacientes</title>

<style>

body{

    margin:0;

    padding:40px;

    font-family:Arial, Helvetica, sans-serif;

    background:linear-gradient(
    to right,
    #1d5fa2,
    #28d7f7);
}

.container{

    width:95%;

    margin:auto;

    background:white;

    padding:30px;

    border-radius:20px;

    box-shadow:0px 8px 20px rgba(0,0,0,0.2);
}

h1{

    text-align:center;

    color:#1d5fa2;

    margin-bottom:30px;
}

/* PESQUISA */

.pesquisa{

    text-align:center;

    margin-bottom:25px;
}

.pesquisa input{

    width:350px;

    padding:12px;

    border-radius:10px;

    border:1px solid #ccc;

    font-size:15px;
}

/* TABELA */

table{

    width:100%;

    border-collapse:collapse;
}

th{

    background:#1d5fa2;

    color:white;

    padding:15px;

    text-align:center;
}

td{

    padding:15px;

    text-align:center;

    border-bottom:1px solid #ddd;
}

tr:hover{

    background:#f5f5f5;
}

/* BOTÕES */

button{

    padding:10px 18px;

    border:none;

    border-radius:10px;

    cursor:pointer;

    color:white;

    font-weight:bold;

    margin:3px;
}

.editar{

    background:#28a745;
}

.excluir{

    background:#dc3545;
}

.imprimir{

    background:#1d5fa2;
}

.voltar{

    background:#555;
}

.botoes{

    text-align:center;

    margin-top:30px;
}

/* IMPRESSÃO */

@media print{

    .pesquisa{

        display:none;
    }

    .botoes{

        display:none;
    }

    body{

        background:white;
    }

    .container{

        box-shadow:none;
    }
}

</style>

<script>

function pesquisarPaciente(){

    let input =
    document.getElementById("pesquisa");

    let filtro =
    input.value.toUpperCase();

    let tabela =
    document.getElementById("tabelaPacientes");

    let tr =
    tabela.getElementsByTagName("tr");

    for(let i = 1; i < tr.length; i++){

        let texto =
        tr[i].textContent ||
        tr[i].innerText;

        if(texto.toUpperCase()
        .indexOf(filtro) > -1){

            tr[i].style.display = "";

        }else{

            tr[i].style.display = "none";
        }
    }
}

</script>

</head>

<body>

<div class="container">

<h1>Relatório de Pacientes</h1>

<!-- PESQUISA -->

<div class="pesquisa">

<input
type="text"
id="pesquisa"
onkeyup="pesquisarPaciente()"
placeholder="Pesquisar nome, telefone, CPF ou idade...">

</div>

<!-- TABELA -->

<table id="tabelaPacientes">

<tr>

<th>ID</th>
<th>Nome</th>
<th>Idade</th>
<th>Telefone</th>
<th>CPF</th>
<th>Ações</th>

</tr>

<%

if(listaPacientes != null){

for(Paciente paciente : listaPacientes){

%>

<tr>

<td><%= paciente.getId() %></td>

<td><%= paciente.getNome() %></td>

<td><%= paciente.getIdade() %></td>

<td><%= paciente.getTelefone() %></td>

<td><%= paciente.getCpf() %></td>

<td>

<a href="editarPaciente.jsp?id=<%= paciente.getId() %>">

<button class="editar">

Editar

</button>

</a>

<a href="ExcluirPacienteServlet?id=<%= paciente.getId() %>">

<button
class="excluir"

onclick="return confirm(
'Deseja realmente excluir este paciente?')">

Excluir

</button>

</a>

</td>

</tr>

<%

}

}

%>

</table>

<!-- BOTÕES -->

<div class="botoes">

<button
class="imprimir"
onclick="window.print()">

Imprimir Relatório

</button>

<a href="home.html">

<button class="voltar">

Voltar ao Menu

</button>

</a>

</div>

</div>

</body>

</html>