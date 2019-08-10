package br.com.satisfacao.models;

import java.sql.Timestamp;

public class Satisfacao {

	private Long id;
	private String comentario;
	private Timestamp dt_incl;
	private Integer pontualidade;
	private Integer clareza;
	private Integer mtd_avaliacao;
	private Integer sabedoria;
	private Professor professor;
	private Aluno aluno;

	public Satisfacao() {}

	public Satisfacao(String comentario, Integer pontualidade, Integer clareza, Integer mtd_avaliacao,
			Integer sabedoria, Professor professor, Aluno aluno) {
		this.comentario = comentario;
		this.pontualidade = pontualidade;
		this.clareza = clareza;
		this.mtd_avaliacao = mtd_avaliacao;
		this.sabedoria = sabedoria;
		this.professor = professor;
		this.aluno = aluno;
	}

	// Any Methods

	// Getters and Setters

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	public Timestamp getDt_incl() {
		return dt_incl;
	}

	public void setDt_incl(Timestamp dt_incl) {
		this.dt_incl = dt_incl;
	}

	public Integer getPontualidade() {
		return pontualidade;
	}

	public void setPontualidade(Integer pontualidade) {
		this.pontualidade = pontualidade;
	}

	public Integer getClareza() {
		return clareza;
	}

	public void setClareza(Integer clareza) {
		this.clareza = clareza;
	}

	public Integer getMtd_avaliacao() {
		return mtd_avaliacao;
	}

	public void setMtd_avaliacao(Integer mtd_avaliacao) {
		this.mtd_avaliacao = mtd_avaliacao;
	}

	public Integer getSabedoria() {
		return sabedoria;
	}

	public void setSabedoria(Integer sabedoria) {
		this.sabedoria = sabedoria;
	}

	public Professor getProfessor() {
		return professor;
	}

	public void setProfessor(Professor professor) {
		this.professor = professor;
	}

	public Aluno getAluno() {
		return aluno;
	}

	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}

}
