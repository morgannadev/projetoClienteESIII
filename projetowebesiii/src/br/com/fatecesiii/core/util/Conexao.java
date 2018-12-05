package br.com.fatecesiii.core.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		
		/**
		 * Para script da criação do banco de dados, verifique a pasta documents do projeto.
		 * Classe conexão para banco de dados MySQL.
		 */
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/projetoweb";
		String user = "root";
		String password = "MySQL@123";
		
		Class.forName(driver);
		Connection connection = DriverManager.getConnection(url, user, password);

		return connection;
	}
}
