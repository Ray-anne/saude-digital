package servlet;

import dao.UsuarioDAO;
import model.Usuario;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ListarUsuariosServlet")
public class ListarUsuariosServlet
extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(

    HttpServletRequest request,
    HttpServletResponse response)

    throws ServletException, IOException {

        UsuarioDAO dao =
                new UsuarioDAO();

        ArrayList<Usuario> listaUsuarios =
                (ArrayList<Usuario>)
                dao.listarUsuarios();

        request.setAttribute(
        "listaUsuarios",
        listaUsuarios);

        request.getRequestDispatcher(

        "usuarios.jsp")

        .forward(request, response);
    }
}