package dao;

import model.Usuario;

public class TesteCadastro {

    public static void main(String[] args) {

        Usuario usuario = new Usuario();

        usuario.setEmail("admin@teste.com");
        usuario.setSenha("123");

        UsuarioDAO dao = new UsuarioDAO();

        dao.cadastrarUsuario(usuario);

    }
}