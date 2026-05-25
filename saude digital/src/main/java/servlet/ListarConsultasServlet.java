package servlet;

import java.io.IOException;
import java.util.List;

import dao.ConsultaDAO;
import model.Consulta;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ListarConsultasServlet")
public class ListarConsultasServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ConsultaDAO dao = new ConsultaDAO();

        List<Consulta> lista = dao.listarConsultas();

        request.setAttribute("consultas", lista);

        request.getRequestDispatcher("listarConsultas.jsp")
               .forward(request, response);
    }
}