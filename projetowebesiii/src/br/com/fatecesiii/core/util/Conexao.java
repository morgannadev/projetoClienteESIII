package br.com.fatecesiii.core.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		
		// TODO: Alterar para MySQL.
		String driver = "org.postgresql.Driver";
		String url = "jdbc:postgresql://localhost:5432/fatec12015";
		String user = "postgres";
		String password = "postgres";
		Class.forName(driver);
		Connection connection = DriverManager.getConnection( url, user, password);

		return connection;
	}
}
