package br.com.satisfacao.models;

import java.sql.Timestamp;

public class Votacao {

	private Long id;
	private String comentario;
	private Timestamp dt_incl;
	private Integer pontualidade;
	private Integer clareza;
	private Integer mtd_avaliacao;
	private Integer conhecimento;
	private Professor professor;
	private Aluno aluno;

	public Votacao() {}

	public Votacao(String comentario, Integer pontualidade, Integer clareza, Integer mtd_avaliacao,
			Integer conhecimento, Professor professor, Aluno aluno) {
		this.comentario = comentario;
		this.pontualidade = pontualidade;
		this.clareza = clareza;
		this.mtd_avaliacao = mtd_avaliacao;
		this.conhecimento = conhecimento;
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

	public Integer getConhecimento() {
		return conhecimento;
	}

	public void setConhecimento(Integer conhecimento) {
		this.conhecimento = conhecimento;
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
