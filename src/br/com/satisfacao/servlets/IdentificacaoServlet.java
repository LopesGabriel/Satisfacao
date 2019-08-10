package br.com.satisfacao.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.satisfacao.dao.DaoAluno;
import br.com.satisfacao.models.Aluno;

@WebServlet("/identificacao")
public class IdentificacaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DaoAluno dao = new DaoAluno();
       
    public IdentificacaoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String retorno = "1";
		String nome = request.getParameter("nome");
		String matricula = request.getParameter("mat");
		String semestre = request.getParameter("sem");
		
		Aluno aluno = new Aluno(nome, matricula, Integer.parseInt(semestre));
		Aluno validacao = dao.buscarAluno(aluno);
		
		if(validacao == null) {
			retorno = dao.salvar(aluno);
		}
		
		if(validacao.isBl_sit()) {
			response.getWriter().write("2");
			return;
		}
		
		if(retorno == "1") {
			aluno.setBl_sit(false);
			HttpSession session = request.getSession();
			session.setAttribute("aluno", aluno);
		}
		
		response.getWriter().write(retorno);
		
	}

}
