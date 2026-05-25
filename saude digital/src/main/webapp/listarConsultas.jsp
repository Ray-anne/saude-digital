<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="model.Consulta" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Consultas</title>

<link rel="stylesheet" href="css/style.css">

<style>

body{

    padding:40px;

    display:block;
}

h2{

    text-align:center;

    color:white;

    margin-bottom:30px;

    font-size:35px;
}

.search-box{

    width:500px;

    margin:auto;

    margin-bottom:25px;
}

.search-box input{

    width:100%;

    padding:12px;

    border-radius:10px;

    border:none;

    font-size:15px;
}

.table-container{

    width:95%;

    margin:auto;

    background:white;

    padding:25px;

    border-radius:20px;

    box-shadow:0px 8px 25px rgba(0,0,0,0.3);
}

/* TABELA */

table{

    width:100%;

    border-collapse:collapse;
}

th{

    background-color:#1d5fa2;

    color:white;

    padding:14px;

    text-align:center;
}

td{

    padding:14px;

    text-align:center;

    border-bottom:1px solid #ddd;
}

tr:hover{

    background-color:#f5f5f5;
}

/* AÇÕES */

.actions{

    display:flex;

    justify-content:center;

    gap:10px;
}

/* STATUS */

.confirmada{

    color:green;

    font-weight:bold;
}

.reagendada{

    color:orange;

    font-weight:bold;
}

.cancelada{

    color:red;

    font-weight:bold;
}

/* IMPRESSÃO */

@media print{

    body{

        background:white !important;

        padding:20px;
    }

    button{

        display:none;
    }

    a{

        display:none;
    }

    .search-box{

        display:none;
    }

    .table-container{

        box-shadow:none;

        border:none;

        padding:0;
    }
}

</style>

<script>

function pesquisarConsulta() {

    let input =
    document.getElementById("pesquisa");

    let filtro =
    input.value.toUpperCase();

    let tabela =
    document.getElementById("tabelaConsultas");

    let tr =
    tabela.getElementsByTagName("tr");

    for(let i = 1; i < tr.length; i++) {

        let texto =
        tr[i].textContent || tr[i].innerText;

        if(texto.toUpperCase().indexOf(filtro) > -1){

            tr[i].style.display = "";

        } else {

            tr[i].style.display = "none";
        }
    }
}

</script>

</head>

<body>

<h2>Relatório de Consultas</h2>

<div class="search-box">

<input
type="text"
id="pesquisa"
onkeyup="pesquisarConsulta()"
placeholder="Pesquisar consultas...">

</div>

<div class="table-container">

<table id="tabelaConsultas">

<tr>

<th>ID</th>
<th>Paciente</th>
<th>Especialidade</th>
<th>Região</th>
<th>Data</th>
<th>Horário</th>
<th>Status</th>
<th>Ações</th>

</tr>

<%

List<Consulta> lista =
(List<Consulta>) request.getAttribute("consultas");

if(lista != null){

for(Consulta consulta : lista){

String classeStatus = "";

if(consulta.getStatusConsulta() != null){

    if(consulta.getStatusConsulta().equals("Confirmada")){

        classeStatus = "confirmada";

    } else if(consulta.getStatusConsulta().equals("Reagendada")){

        classeStatus = "reagendada";

    } else {

        classeStatus = "cancelada";
    }
}

%>

<tr>

<td><%= consulta.getId() %></td>

<td><%= consulta.getPaciente() %></td>

<td><%= consulta.getEspecialidade() %></td>

<td><%= consulta.getRegiao() %></td>

<td><%= consulta.getDataConsulta() %></td>

<td><%= consulta.getHorario() %></td>

<td class="<%= classeStatus %>">

<%= consulta.getStatusConsulta() %>

</td>

<td>

<div class="actions">

<a href="editarConsulta.jsp?id=<%= consulta.getId() %>">

<button type="button">

Editar

</button>

</a>

<a href="ExcluirConsultaServlet?id=<%= consulta.getId() %>">

<button type="button">

Excluir

</button>

</a>

</div>

</td>

</tr>

<%

}

}

%>

</table>

</div>

<br><br>

<div style="text-align:center;">

<button
onclick="window.print()"
style="width:250px;">

Imprimir Relatório

</button>

</div>

<br>

<div style="text-align:center;">

<a href="home.html">

<button
type="button"
style="width:250px;">

Voltar ao Menu

</button>

</a>

</div>

</body>
</html>