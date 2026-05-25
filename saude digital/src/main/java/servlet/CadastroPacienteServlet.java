package servlet;

import java.io.IOException;

import dao.PacienteDAO;
import model.Paciente;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CadastroPacienteServlet")
public class CadastroPacienteServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        Paciente paciente =
                new Paciente();

        paciente.setNome(
        request.getParameter("nome")
        );

        paciente.setIdade(
        Integer.parseInt(
        request.getParameter("idade"))
        );

        paciente.setTelefone(
        request.getParameter("telefone")
        );

        paciente.setCpf(
        request.getParameter("cpf")
        );

        PacienteDAO dao =
                new PacienteDAO();

        dao.cadastrarPaciente(paciente);

        response.sendRedirect(
        "cadastroPaciente.jsp"
        );
    }
}