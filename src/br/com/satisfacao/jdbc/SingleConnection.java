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
	private static final String BANCO = "jdbc:mysql://31.220.62.68:3306/satisfacao";
	private static final String USER = "gabriel";
	private static final String SENHA = "Biellindo3-";
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
				Class.forName("com.mysql.cj.jdbc.Driver");
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
