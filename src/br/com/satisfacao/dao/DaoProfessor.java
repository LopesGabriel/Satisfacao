package br.com.satisfacao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.satisfacao.jdbc.SingleConnection;
import br.com.satisfacao.models.Professor;

public class DaoProfessor {

	private Connection connection;
	
	public DaoProfessor() {
		connection = SingleConnection.getConnection();
	}
	
	public String salvar(String nome, String matricula, String disciplina) {
		String retorno = "0";
		String sql = "INSERT INTO tb_professor(nome, matricula, disciplina) values(?, ?, ?)";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setString(1, nome);
			st.setString(2, matricula);
			st.setString(3, disciplina);
			st.execute();
			connection.commit();
			st.close();
			retorno = "1";
		}catch(SQLException e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return retorno;
	}
	
	public List<Professor> listarProfessores(){
		List<Professor> lista = new ArrayList<Professor>();
		String sql = "SELECT * from tb_professor";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				Professor professor = new Professor();
				professor.setId(rs.getLong("id"));
				professor.setNome(rs.getString("nome"));
				professor.setAtivo(rs.getBoolean("flg_ativo"));
				professor.setMatricula(rs.getString("matricula"));
				professor.setDisciplina(rs.getString("disciplina"));
				lista.add(professor);
			}
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
		return lista;
	}
	
	public Professor buscarProfessor(Professor professor) {
		Professor prof = null;
		String sql = "SELECT * FROM tb_professor Where id = ?";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setLong(1, professor.getId());
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				prof = new Professor();
				prof.setId(rs.getLong("id"));
				prof.setNome(rs.getString("nome"));
				prof.setMatricula(rs.getString("matricula"));
				prof.setAtivo(rs.getBoolean("flg_ativo"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return prof;
	}
	
	public String atualizar(Professor p) {
		String retorno = "1";
		String sql = "Update tb_professor Set flg_ativo = ? Where id = " + p.getId();
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setBoolean(1, p.isAtivo());
			st.execute();
		}catch(SQLException e) {
			e.printStackTrace();
			retorno = "0";
			try {
				connection.rollback();
			}catch(SQLException e1) {
				e.printStackTrace();
			}
		}finally {
			try {
				connection.commit();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return retorno;
	}
	
}
