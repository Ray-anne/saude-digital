package servlet;

import java.io.IOException;

import dao.ConsultaDAO;
import model.Consulta;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditarConsultaServlet")
public class EditarConsultaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        Consulta consulta = new Consulta();

        consulta.setId(
        Integer.parseInt(
        request.getParameter("id"))
        );

        consulta.setPaciente(
        request.getParameter("paciente")
        );

        consulta.setEspecialidade(
        request.getParameter("especialidade")
        );

        consulta.setRegiao(
        request.getParameter("regiao")
        );

        consulta.setDataConsulta(
        request.getParameter("dataConsulta")
        );

        consulta.setHorario(
        request.getParameter("horario")
        );

        consulta.setStatusConsulta(
        request.getParameter("statusConsulta")
        );

        ConsultaDAO dao =
                new ConsultaDAO();

        dao.atualizarConsulta(consulta);

        response.sendRedirect(
        "ListarConsultasServlet"
        );
    }
}