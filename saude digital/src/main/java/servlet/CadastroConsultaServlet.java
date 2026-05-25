package servlet;

import java.io.IOException;

import dao.ConsultaDAO;
import model.Consulta;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CadastroConsultaServlet")
public class CadastroConsultaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String paciente =
                request.getParameter("paciente");

        String especialidade =
                request.getParameter("especialidade");

        String regiao =
                request.getParameter("regiao");

        String dataConsulta =
                request.getParameter("dataConsulta");

        String horario =
                request.getParameter("horario");

        Consulta consulta = new Consulta();

        consulta.setPaciente(paciente);

        consulta.setEspecialidade(especialidade);

        consulta.setRegiao(regiao);

        consulta.setDataConsulta(dataConsulta);

        consulta.setHorario(horario);

        ConsultaDAO dao = new ConsultaDAO();

        dao.cadastrarConsulta(consulta);

        response.sendRedirect("ListarConsultasServlet");
    }
}