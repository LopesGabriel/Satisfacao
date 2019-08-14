package br.com.satisfacao.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnection {

	/*
	 * private static final String BANCO =
	 * "jdbc:mysql://remotemysql.com:3306/F7d18V9uiJ?autoReconnect=true"; private
	 * static final String USER = "F7d18V9uiJ"; private static final String SENHA =
	 * "dTwoCGVeq9";
	 */
	private static final String BANCO = "jdbc:mysql://localhost:3306/satisfacao?autoReconnect=true";
	private static final String USER = "satisfacao";
	private static final String SENHA = "uniplan";
	private static Connection connection = null;

	static {
		conectar();
	}

	public SingleConnection() {
		conectar();
	}

	private static void conectar() {
		try {
			if(connection == null) {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection(BANCO, USER, SENHA);
				connection.setAutoCommit(false);
			}
		}catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Erro ao conectar com o banco: " + e.getMessage());
		}
	}

	public static Connection getConnection() {
		return connection;
	}

}
