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
		List<Professor> lista = daoProfessor.listarProfessores();
		List<String> campoConhe = new ArrayList<String>();
		List<String> campoPont = new ArrayList<String>();
		List<String> campoClar = new ArrayList<String>();
		List<String> campoMtda = new ArrayList<String>();
		List<String> listaReq = new ArrayList<String>();
		
		for (int i = 0; i < lista.size(); i++) {
			campoConhe.add(lista.get(i).getMatricula() + "Conhe");
			campoPont.add(lista.get(i).getMatricula()+ "Pont");
			campoClar.add(lista.get(i).getMatricula()+ "Clar");
			campoMtda.add(lista.get(i).getMatricula()+ "Mtda");
		}
		
		for (int i = 0; i < lista.size(); i++) {
			listaReq.add(campoClar.get(i));
			listaReq.add(campoPont.get(i));
			listaReq.add(campoConhe.get(i));
			listaReq.add(campoMtda.get(i));
		}
		
		
	}

}
