package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

import model.Paciente;
import util.Conexao;

public class PacienteDAO {

    /* CADASTRAR */

    public void cadastrarPaciente(Paciente paciente) {

        String sql =
        "INSERT INTO pacientes " +
        "(nome, idade, telefone, cpf) " +
        "VALUES (?, ?, ?, ?)";

        try {

            Connection conn =
                    Conexao.conectar();

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            stmt.setString(1,
            paciente.getNome());

            stmt.setInt(2,
            paciente.getIdade());

            stmt.setString(3,
            paciente.getTelefone());

            stmt.setString(4,
            paciente.getCpf());

            stmt.execute();

            stmt.close();

            conn.close();

            System.out.println(
            "Paciente cadastrado com sucesso!"
            );

        } catch (Exception e) {

            System.out.println(
            "Erro ao cadastrar paciente: "
            + e.getMessage()
            );
        }
    }

    /* LISTAR */

    public List<Paciente> listarPacientes() {

        List<Paciente> lista =
                new ArrayList<>();

        String sql =
                "SELECT * FROM pacientes";

        try {

            Connection conn =
                    Conexao.conectar();

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            ResultSet rs =
                    stmt.executeQuery();

            while(rs.next()) {

                Paciente paciente =
                        new Paciente();

                paciente.setId(
                rs.getInt("id")
                );

                paciente.setNome(
                rs.getString("nome")
                );

                paciente.setIdade(
                rs.getInt("idade")
                );

                paciente.setTelefone(
                rs.getString("telefone")
                );

                paciente.setCpf(
                rs.getString("cpf")
                );

                lista.add(paciente);
            }

            rs.close();

            stmt.close();

            conn.close();

        } catch (Exception e) {

            System.out.println(
            "Erro ao listar pacientes: "
            + e.getMessage()
            );
        }

        return lista;
    }

    /* BUSCAR POR ID */

    public Paciente buscarPacientePorId(int id) {

        Paciente paciente =
                new Paciente();

        String sql =
        "SELECT * FROM pacientes WHERE id=?";

        try {

            Connection conn =
                    Conexao.conectar();

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            stmt.setInt(1, id);

            ResultSet rs =
                    stmt.executeQuery();

            if(rs.next()) {

                paciente.setId(
                rs.getInt("id")
                );

                paciente.setNome(
                rs.getString("nome")
                );

                paciente.setIdade(
                rs.getInt("idade")
                );

                paciente.setTelefone(
                rs.getString("telefone")
                );

                paciente.setCpf(
                rs.getString("cpf")
                );
            }

            rs.close();

            stmt.close();

            conn.close();

        } catch (Exception e) {

            System.out.println(
            "Erro ao buscar paciente: "
            + e.getMessage()
            );
        }

        return paciente;
    }

    /* ATUALIZAR */

    public void atualizarPaciente(Paciente paciente) {

        String sql =
        "UPDATE pacientes SET " +
        "nome=?, idade=?, telefone=?, cpf=? " +
        "WHERE id=?";

        try {

            Connection conn =
                    Conexao.conectar();

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            stmt.setString(1,
            paciente.getNome());

            stmt.setInt(2,
            paciente.getIdade());

            stmt.setString(3,
            paciente.getTelefone());

            stmt.setString(4,
            paciente.getCpf());

            stmt.setInt(5,
            paciente.getId());

            stmt.executeUpdate();

            stmt.close();

            conn.close();

            System.out.println(
            "Paciente atualizado com sucesso!"
            );

        } catch (Exception e) {

            System.out.println(
            "Erro ao atualizar paciente: "
            + e.getMessage()
            );
        }
    }

    /* EXCLUIR */

    public void excluirPaciente(int id) {

        String sql =
        "DELETE FROM pacientes WHERE id=?";

        try {

            Connection conn =
                    Conexao.conectar();

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            stmt.setInt(1, id);

            stmt.execute();

            stmt.close();

            conn.close();

            System.out.println(
            "Paciente excluído com sucesso!"
            );

        } catch (Exception e) {

            System.out.println(
            "Erro ao excluir paciente: "
            + e.getMessage()
            );
        }
    }
}