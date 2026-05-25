<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="dao.ConsultaDAO" %>
<%@ page import="model.Consulta" %>

<%

int id = Integer.parseInt(request.getParameter("id"));

ConsultaDAO dao = new ConsultaDAO();

Consulta consulta = dao.buscarConsultaPorId(id);

%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Editar Consulta</title>

<link rel="stylesheet" href="css/style.css">

<style>

body{

    display:block;

    padding:40px;
}

.container{

    width:500px;

    margin:auto;

    background:white;

    padding:35px;

    border-radius:20px;

    box-shadow:0px 8px 25px rgba(0,0,0,0.3);
}

h2{

    text-align:center;

    color:#1d5fa2;

    margin-bottom:25px;
}

.form-group{

    display:flex;

    flex-direction:column;

    gap:18px;
}

input,
select{

    width:100%;

    padding:12px;

    border-radius:10px;

    border:1px solid #ccc;

    font-size:15px;

    box-sizing:border-box;
}

button{

    margin-top:10px;
}

</style>

</head>

<body>

<div class="container">

<h2>Editar Consulta</h2>

<form action="EditarConsultaServlet" method="post">

<div class="form-group">

<input
type="hidden"
name="id"
value="<%= consulta.getId() %>">

<input
type="text"
name="paciente"
value="<%= consulta.getPaciente() %>"
required>

<select name="especialidade">

<option value="Clínico Geral"
<%= "Clínico Geral".equals(consulta.getEspecialidade()) ? "selected" : "" %>>

Clínico Geral

</option>

<option value="Cardiologia"
<%= "Cardiologia".equals(consulta.getEspecialidade()) ? "selected" : "" %>>

Cardiologia

</option>

<option value="Dermatologia"
<%= "Dermatologia".equals(consulta.getEspecialidade()) ? "selected" : "" %>>

Dermatologia

</option>

<option value="Pediatria"
<%= "Pediatria".equals(consulta.getEspecialidade()) ? "selected" : "" %>>

Pediatria

</option>

<option value="Ortopedia"
<%= "Ortopedia".equals(consulta.getEspecialidade()) ? "selected" : "" %>>

Ortopedia

</option>

</select>

<select name="regiao">

<option value="Fortaleza"
<%= "Fortaleza".equals(consulta.getRegiao()) ? "selected" : "" %>>

Fortaleza

</option>

<option value="Caucaia"
<%= "Caucaia".equals(consulta.getRegiao()) ? "selected" : "" %>>

Caucaia

</option>

<option value="Maracanaú"
<%= "Maracanaú".equals(consulta.getRegiao()) ? "selected" : "" %>>

Maracanaú

</option>

<option value="Pacatuba"
<%= "Pacatuba".equals(consulta.getRegiao()) ? "selected" : "" %>>

Pacatuba

</option>

</select>

<input
type="date"
name="dataConsulta"
value="<%= consulta.getDataConsulta() %>"
required>

<select name="horario">

<option value="08:00"
<%= "08:00".equals(consulta.getHorario()) ? "selected" : "" %>>

08:00

</option>

<option value="09:00"
<%= "09:00".equals(consulta.getHorario()) ? "selected" : "" %>>

09:00

</option>

<option value="10:00"
<%= "10:00".equals(consulta.getHorario()) ? "selected" : "" %>>

10:00

</option>

<option value="11:00"
<%= "11:00".equals(consulta.getHorario()) ? "selected" : "" %>>

11:00

</option>

<option value="14:00"
<%= "14:00".equals(consulta.getHorario()) ? "selected" : "" %>>

14:00

</option>

<option value="15:00"
<%= "15:00".equals(consulta.getHorario()) ? "selected" : "" %>>

15:00

</option>

<option value="16:00"
<%= "16:00".equals(consulta.getHorario()) ? "selected" : "" %>>

16:00

</option>

</select>

<select name="statusConsulta">

<option value="Confirmada"
<%= "Confirmada".equals(consulta.getStatusConsulta()) ? "selected" : "" %>>

Confirmada

</option>

<option value="Reagendada"
<%= "Reagendada".equals(consulta.getStatusConsulta()) ? "selected" : "" %>>

Reagendada

</option>

<option value="Cancelada"
<%= "Cancelada".equals(consulta.getStatusConsulta()) ? "selected" : "" %>>

Cancelada

</option>

</select>

<button type="submit">

Salvar Alterações

</button>

</div>

</form>

<br>

<a href="ListarConsultasServlet">

<button type="button">

Voltar

</button>

</a>

</div>

</body>
</html>