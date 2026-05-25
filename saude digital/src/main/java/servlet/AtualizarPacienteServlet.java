package servlet;

import java.io.IOException;

import dao.PacienteDAO;
import model.Paciente;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AtualizarPacienteServlet")
public class AtualizarPacienteServlet
extends HttpServlet {

    protected void doPost(
    HttpServletRequest request,
    HttpServletResponse response)

    throws ServletException, IOException {

        Paciente paciente =
                new Paciente();

        paciente.setId(
        Integer.parseInt(
        request.getParameter("id")));

        paciente.setNome(
        request.getParameter("nome"));

        paciente.setIdade(
        Integer.parseInt(
        request.getParameter("idade")));

        paciente.setTelefone(
        request.getParameter("telefone"));

        paciente.setCpf(
        request.getParameter("cpf"));

        PacienteDAO dao =
                new PacienteDAO();

        dao.atualizarPaciente(paciente);

        response.sendRedirect(
        "ListarPacientesServlet");
    }
}