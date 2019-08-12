package br.com.satisfacao.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.satisfacao.dao.DaoProfessor;
import br.com.satisfacao.models.Professor;


@WebServlet("/votacao")
public class VotacaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DaoProfessor dao = new DaoProfessor();
       
    public VotacaoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Professor> lista = dao.listarProfessores();
		int i = lista.size();
		
		if(i < 1) {
			response.getWriter().write("0");
		}else {
			request.setAttribute("professores", lista);
			String destino = "questionario.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(destino);
			dispatcher.forward(request, response);
			return;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String acao = request.getParameter("acao");
		String id = request.getParameter("id");
		
		// Declaração das variaveis
		RequestDispatcher dispatcher = null;
		
		switch (acao) {
		case "listarProfessores":
			List<Professor> lista = dao.listarProfessoresAtivos();
			request.setAttribute("professores", lista);
			dispatcher = request.getRequestDispatcher("card_professor.jsp");
			break;
		case "formProfessor":
			dispatcher = request.getRequestDispatcher("quest_professor.jsp");
		}
		if(dispatcher != null) {
			dispatcher.forward(request, response);
		}else {
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao processar requisição");
		}
		
		return;
	}

}
