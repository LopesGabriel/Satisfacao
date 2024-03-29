package br.com.satisfacao.models;

public class Professor {

	private Long id;
	private String nome;
	private String matricula;
	private boolean ativo;
	private String disciplina;

	// Constructs

	public Professor() {}
	
	public Professor(Long id) {
		this.id = id;
	}

	public Professor(String nome, String matricula, String disciplina) {
		this.nome = nome;
		this.matricula = matricula;
		this.disciplina = disciplina;
	}

	// Any methods

	// Getters And Setters

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

	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

	public String getDisciplina() {
		return disciplina;
	}

	public void setDisciplina(String disciplina) {
		this.disciplina = disciplina;
	}

}
