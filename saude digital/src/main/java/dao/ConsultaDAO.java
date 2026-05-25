package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

import model.Consulta;
import util.Conexao;

public class ConsultaDAO {

    /* CADASTRAR */

    public void cadastrarConsulta(Consulta consulta) {

        String sql =
        "INSERT INTO consultas " +
        "(paciente, especialidade, regiao, dataConsulta, horario, statusConsulta) " +
        "VALUES (?, ?, ?, ?, ?, ?)";

        try {

            Connection conn =
                    Conexao.conectar();

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            stmt.setString(1,
            consulta.getPaciente());

            stmt.setString(2,
            consulta.getEspecialidade());

            stmt.setString(3,
            consulta.getRegiao());

            stmt.setString(4,
            consulta.getDataConsulta());

            stmt.setString(5,
            consulta.getHorario());

            stmt.setString(6,
            consulta.getStatusConsulta());

            stmt.execute();

            stmt.close();

            conn.close();

            System.out.println(
            "Consulta cadastrada com sucesso!"
            );

        } catch (Exception e) {

            System.out.println(
            "Erro ao cadastrar consulta: "
            + e.getMessage()
            );
        }
    }

    /* LISTAR */

    public List<Consulta> listarConsultas() {

        List<Consulta> lista =
                new ArrayList<>();

        String sql =
                "SELECT * FROM consultas";

        try {

            Connection conn =
                    Conexao.conectar();

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            ResultSet rs =
                    stmt.executeQuery();

            while(rs.next()) {

                Consulta consulta =
                        new Consulta();

                consulta.setId(
                rs.getInt("id")
                );

                consulta.setPaciente(
                rs.getString("paciente")
                );

                consulta.setEspecialidade(
                rs.getString("especialidade")
                );

                consulta.setRegiao(
                rs.getString("regiao")
                );

                consulta.setDataConsulta(
                rs.getString("dataConsulta")
                );

                consulta.setHorario(
                rs.getString("horario")
                );

                consulta.setStatusConsulta(
                rs.getString("statusConsulta")
                );

                lista.add(consulta);
            }

            rs.close();

            stmt.close();

            conn.close();

        } catch (Exception e) {

            System.out.println(
            "Erro ao listar consultas: "
            + e.getMessage()
            );
        }

        return lista;
    }

    /* EXCLUIR */

    public void excluirConsulta(int id) {

        String sql =
        "DELETE FROM consultas WHERE id=?";

        try {

            Connection conn =
                    Conexao.conectar();

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            stmt.setInt(1, id);

            stmt.execute();

            /* REORGANIZA IDS */

            PreparedStatement reset =
            conn.prepareStatement(
            "SET @count = 0"
            );

            reset.execute();

            PreparedStatement update =
            conn.prepareStatement(

            "UPDATE consultas " +
            "SET id = (@count:= @count + 1)"
            );

            update.execute();

            PreparedStatement auto =
            conn.prepareStatement(

            "ALTER TABLE consultas " +
            "AUTO_INCREMENT = 1"
            );

            auto.execute();

            stmt.close();

            reset.close();

            update.close();

            auto.close();

            conn.close();

            System.out.println(
            "Consulta excluída e IDs reorganizados!"
            );

        } catch (Exception e) {

            System.out.println(

            "Erro ao excluir consulta: "
            + e.getMessage()
            );
        }
    }
    /* BUSCAR POR ID */

    public Consulta buscarConsultaPorId(int id) {

        Consulta consulta =
                new Consulta();

        String sql =
        "SELECT * FROM consultas WHERE id=?";

        try {

            Connection conn =
                    Conexao.conectar();

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            stmt.setInt(1, id);

            ResultSet rs =
                    stmt.executeQuery();

            if(rs.next()) {

                consulta.setId(
                rs.getInt("id")
                );

                consulta.setPaciente(
                rs.getString("paciente")
                );

                consulta.setEspecialidade(
                rs.getString("especialidade")
                );

                consulta.setRegiao(
                rs.getString("regiao")
                );

                consulta.setDataConsulta(
                rs.getString("dataConsulta")
                );

                consulta.setHorario(
                rs.getString("horario")
                );

                consulta.setStatusConsulta(
                rs.getString("statusConsulta")
                );
            }

            rs.close();

            stmt.close();

            conn.close();

        } catch (Exception e) {

            System.out.println(
            "Erro ao buscar consulta: "
            + e.getMessage()
            );
        }

        return consulta;
    }

    /* ATUALIZAR */

    public void atualizarConsulta(Consulta consulta) {

        String sql =
        "UPDATE consultas SET " +
        "paciente=?, especialidade=?, regiao=?, " +
        "dataConsulta=?, horario=?, statusConsulta=? " +
        "WHERE id=?";

        try {

            Connection conn =
                    Conexao.conectar();

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            stmt.setString(1,
            consulta.getPaciente());

            stmt.setString(2,
            consulta.getEspecialidade());

            stmt.setString(3,
            consulta.getRegiao());

            stmt.setString(4,
            consulta.getDataConsulta());

            stmt.setString(5,
            consulta.getHorario());

            stmt.setString(6,
            consulta.getStatusConsulta());

            stmt.setInt(7,
            consulta.getId());

            stmt.executeUpdate();

            stmt.close();

            conn.close();

            System.out.println(
            "Consulta atualizada com sucesso!"
            );

        } catch (Exception e) {

            System.out.println(
            "Erro ao atualizar consulta: "
            + e.getMessage()
            );
        }
    }
}