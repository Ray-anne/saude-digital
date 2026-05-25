package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

import model.Usuario;
import util.Conexao;

public class UsuarioDAO {

    public void cadastrarUsuario(Usuario usuario) {

        String sql = "INSERT INTO usuarios (email, senha) VALUES (?, ?)";

        try {

            Connection conn = Conexao.conectar();

            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, usuario.getEmail());
            stmt.setString(2, usuario.getSenha());

            stmt.execute();

            stmt.close();
            conn.close();

            System.out.println("Usuário cadastrado com sucesso!");

        } catch (Exception e) {

            System.out.println("Erro ao cadastrar: " + e.getMessage());
        }
    }

    public boolean validarLogin(String email, String senha) {

        boolean login = false;

        String sql = "SELECT * FROM usuarios WHERE email = ? AND senha = ?";

        try {

            Connection conn = Conexao.conectar();

            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, email);
            stmt.setString(2, senha);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {

                login = true;
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {

            System.out.println("Erro no login: " + e.getMessage());
        }

        return login;
    }

    public List<Usuario> listarUsuarios() {

        List<Usuario> lista = new ArrayList<>();

        String sql = "SELECT * FROM usuarios";

        try {

            Connection conn = Conexao.conectar();

            PreparedStatement stmt = conn.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while(rs.next()) {

                Usuario usuario = new Usuario();

                usuario.setId(rs.getInt("id"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));

                lista.add(usuario);
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {

            System.out.println("Erro ao listar usuários: " + e.getMessage());
        }

        return lista;
    }

    public void excluirUsuario(int id) {

        String sql = "DELETE FROM usuarios WHERE id = ?";

        try {

            Connection conn = Conexao.conectar();

            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setInt(1, id);

            stmt.execute();

            stmt.close();
            conn.close();

            System.out.println("Usuário excluído com sucesso!");

        } catch (Exception e) {

            System.out.println("Erro ao excluir: " + e.getMessage());
        }
    }

    public void atualizarUsuario(Usuario usuario) {

        String sql = "UPDATE usuarios SET email = ?, senha = ? WHERE id = ?";

        try {

            Connection conn = Conexao.conectar();

            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, usuario.getEmail());
            stmt.setString(2, usuario.getSenha());
            stmt.setInt(3, usuario.getId());

            stmt.execute();

            stmt.close();
            conn.close();

            System.out.println("Usuário atualizado com sucesso!");

        } catch (Exception e) {

            System.out.println("Erro ao atualizar: " + e.getMessage());
        }
        
        
    }
    
    public Usuario buscarUsuarioPorId(int id){

        Usuario usuario =
                new Usuario();

        String sql =
        "SELECT * FROM usuarios WHERE id=?";

        try{

            Connection conn =
                    Conexao.conectar();

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            stmt.setInt(1, id);

            ResultSet rs =
                    stmt.executeQuery();

            if(rs.next()){

                usuario.setId(
                rs.getInt("id"));

                usuario.setEmail(
                rs.getString("email"));

                usuario.setSenha(
                rs.getString("senha"));
            }

            rs.close();
            stmt.close();
            conn.close();

        }catch(Exception e){

            System.out.println(
            "Erro ao buscar usuário: "
            + e.getMessage());
        }

        return usuario;
    }
}