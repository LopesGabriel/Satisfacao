package br.com.satisfacao.servlets;

import java.io.IOException;
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
	private DaoProfessor daoProfessor = new DaoProfessor();
       
    public VotacaoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Professor> lista = daoProfessor.listarProfessores();
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
		
		doGet(request, response);
	}

}
