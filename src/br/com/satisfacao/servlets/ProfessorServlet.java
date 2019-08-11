package br.com.satisfacao.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.satisfacao.dao.DaoProfessor;
import br.com.satisfacao.models.Professor;

@WebServlet("/professor")
public class ProfessorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DaoProfessor dao = new DaoProfessor();
       
    public ProfessorServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Professor> lista = dao.listarProfessores();
		
		if(lista == null || lista.size() <= 0) {
			response.sendError(HttpServletResponse.SC_NO_CONTENT, "Não existem professores");
			return;
		}
		int i = lista.size();
		int x = 0;
		response.setContentType("JSON");
		response.getWriter().append("[");
		
		for (Professor p : lista) {
			x++;
			if(x != i) {
				String dado = "{\"id\": \""+p.getId()+"\", \"nome\": \""+p.getNome()+"\", \"matricula\": \""+p.getMatricula()+"\","
						+ "\"disciplina\": \""+p.getDisciplina()+"\", \"sit\": "+p.isAtivo()+"},";
				response.getWriter().append(dado);
			}else {
				String dado = "{\"id\": \""+p.getId()+"\", \"nome\": \""+p.getNome()+"\", \"matricula\": \""+p.getMatricula()+"\","
						+ "\"disciplina\": \""+p.getDisciplina()+"\", \"sit\": "+p.isAtivo()+"}";
				response.getWriter().append(dado);
			}
		}
		response.getWriter().append("]");
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome = request.getParameter("nome");
		String disciplina = request.getParameter("disc");
		String matricula = request.getParameter("mat");
		
		String retorno = dao.salvar(nome, matricula, disciplina);
		
		if(retorno != "1") {
			response.getWriter().write("0");
			return;
		}
		
		response.getWriter().write(retorno);
		return;
	}

}
