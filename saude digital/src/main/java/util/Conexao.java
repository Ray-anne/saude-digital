package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {

    private static final String URL =
            "jdbc:mysql://switchyard.proxy.rlwy.net:30050/railway";

    private static final String USER = "root";

    private static final String PASSWORD =
            "dgIkZzOynMDOvpCCECwdkeMDjigTlaLr";

    public static Connection conectar() {

        Connection conn = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(URL, USER, PASSWORD);

            System.out.println("Conectado com sucesso!");

        } catch (Exception e) {

            System.out.println("Erro na conexão: " + e.getMessage());
        }

        return conn;
    }
}