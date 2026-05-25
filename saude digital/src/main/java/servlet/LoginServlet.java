package servlet;

import java.io.IOException;

import dao.UsuarioDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        UsuarioDAO dao = new UsuarioDAO();

        boolean login = dao.validarLogin(email, senha);

        if (login) {

        	response.sendRedirect("home.html");
        	
        } else {

            response.getWriter().println(
                "<script>alert('Dados incorretos!');window.location='login.html';</script>"
            );
        }
    }
}