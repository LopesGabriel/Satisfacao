package br.com.satisfacao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.satisfacao.jdbc.SingleConnection;
import br.com.satisfacao.models.Aluno;
import br.com.satisfacao.models.Votacao;

public class DaoVotacao {

	private Connection connection;
	
	public DaoVotacao() {
		connection = SingleConnection.getConnection();
	}
	
	public String salvar(Votacao v) {
		String resultado = "0";
		String sql = "Insert into tb_votos(pontualidade, clareza, mtd_avaliacao, conhecimento, comentario, profid, alunoid) "
				+ "Values(?,?,?,?,?,?,?)";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1, v.getPontualidade());
			st.setInt(2, v.getClareza());
			st.setInt(3, v.getMtd_avaliacao());
			st.setInt(4, v.getConhecimento());
			st.setString(5, v.getComentario());
			st.setLong(6, v.getProfessor().getId());
			st.setLong(7, v.getAluno().getId());
			st.execute();
			resultado = "1";
		}catch(SQLException e) {
			e.printStackTrace();
			resultado = "0";
			try {
				connection.rollback();
			}catch(SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				connection.commit();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return resultado;
	}
	
	public List<Long> professoresJaVotados(Aluno al){
		List<Long> lista = new ArrayList<>();
		String sql = "SELECT profid, alunoid FROM tb_votos WHERE alunoid = "+ al.getId();
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				Long id = rs.getLong("profid");
				lista.add(id);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			try {
				connection.rollback();
			}catch(SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				connection.commit();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return lista;
	}
	
}
