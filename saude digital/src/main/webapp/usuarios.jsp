<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="model.*" %>

<%

ArrayList<Usuario> listaUsuarios =
(ArrayList<Usuario>)
request.getAttribute("listaUsuarios");

%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Relatório de Usuários</title>

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

function pesquisarUsuario(){

    let input =
    document.getElementById("pesquisa");

    let filtro =
    input.value.toUpperCase();

    let tabela =
    document.getElementById("tabelaUsuarios");

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

<h1>Relatório de Usuários</h1>

<!-- PESQUISA -->

<div class="pesquisa">

<input
type="text"
id="pesquisa"
onkeyup="pesquisarUsuario()"
placeholder="Pesquisar usuário...">

</div>

<!-- TABELA -->

<table id="tabelaUsuarios">

<tr>

<th>ID</th>
<th>Email</th>
<th>Senha</th>
<th>Ações</th>

</tr>

<%

if(listaUsuarios != null){

for(Usuario usuario : listaUsuarios){

%>

<tr>

<td><%= usuario.getId() %></td>

<td><%= usuario.getEmail() %></td>

<td><%= usuario.getSenha() %></td>

<td>

<a href="editarUsuario.jsp?id=<%= usuario.getId() %>">

<button class="editar">

Editar

</button>

</a>

<a href="ExcluirUsuarioServlet?id=<%= usuario.getId() %>">

<button
class="excluir"

onclick="return confirm(
'Deseja realmente excluir este usuário?')">

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