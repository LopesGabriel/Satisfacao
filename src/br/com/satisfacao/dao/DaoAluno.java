package br.com.satisfacao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.com.satisfacao.jdbc.SingleConnection;
import br.com.satisfacao.models.Aluno;

public class DaoAluno {
	
	private Connection connection = SingleConnection.getConnection();
	
	public String salvar(Aluno aluno) {
		String retorno = "0";
		String sql = "Insert Into tb_aluno(nome, matricula, semestre) Values(?,?,?)";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setString(1, aluno.getNome());
			st.setString(2, aluno.getMatricula());
			st.setInt(3, aluno.getSemestre());
			st.execute();
			retorno = "1";
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				connection.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return retorno;
	}
	
	public Aluno buscarAluno(Aluno aluno) {
		Aluno al = null;
		String sql = "Select * From tb_aluno Where matricula = '"+aluno.getMatricula()+"'";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				al = new Aluno();
				al.setId(rs.getLong("id"));
				al.setNome(rs.getString("nome"));
				al.setMatricula(rs.getString("matricula"));
				al.setSemestre(rs.getInt("semestre"));
				al.setBl_sit(rs.getBoolean("bl_sit"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return al;
	}

}
