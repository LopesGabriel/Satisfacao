package br.com.satisfacao.dao;

import java.sql.Connection;

import br.com.satisfacao.jdbc.SingleConnection;

public class DaoVotacao {

	private Connection connection;
	
	public DaoVotacao() {
		connection = SingleConnection.getConnection();
	}
	
	public void salvar() {
		
	}
	
}
