package br.com.satisfacao.models;

public class Aluno {

	private Long id;
	private String nome;
	private String matricula;
	private Integer semestre;

	// Constructs

	public Aluno() {}

	public Aluno(String nome, String matricula, Integer semestre) {
		this.nome = nome;
		this.matricula = matricula;
		this.semestre = semestre;
	}

	// Any Method

	// Getters and Setters

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	public Integer getSemestre() {
		return semestre;
	}

	public void setSemestre(Integer semestre) {
		this.semestre = semestre;
	}

}
