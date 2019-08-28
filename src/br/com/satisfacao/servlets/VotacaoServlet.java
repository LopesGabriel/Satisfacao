package br.com.satisfacao.servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import br.com.satisfacao.dao.DaoProfessor;
import br.com.satisfacao.dao.DaoVotacao;
import br.com.satisfacao.models.Aluno;
import br.com.satisfacao.models.Professor;
import br.com.satisfacao.models.Votacao;
import br.com.satisfacao.util.JsonManager;
import br.com.satisfacao.util.UltimaAvaliacao;


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
			request.setAttribute("ultimaAv", UltimaAvaliacao.getUltimaAvaliacao());
			String destino = "questionario.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(destino);
			dispatcher.forward(request, response);
			return;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		Aluno aluno = (Aluno) session.getAttribute("aluno");
		String acao = request.getParameter("acao");
		String id = request.getParameter("id");
		Professor p;
		boolean view = true;
		
		// Declaração das variaveis
		RequestDispatcher dispatcher = null;
		
		switch (acao) {
		case "listarProfessores":
			List<Professor> lista = dao.listarProfessoresAtivos();
			List<Professor> professoresJaAvaliados = new ArrayList<Professor>();
			List<Long> jaAvaliados = new DaoVotacao().professoresJaVotados(aluno);
			for (Long pid : jaAvaliados) {
				for (Professor pLista : lista) {
					if(pLista.getId() == pid) {
						professoresJaAvaliados.add(pLista);
					}
				}
				for (Professor pexcluir : professoresJaAvaliados) {
					lista.remove(pexcluir);
				}
				professoresJaAvaliados.clear();
			}
			if(lista.size() > 0) {
				request.setAttribute("professores", lista);
				dispatcher = request.getRequestDispatcher("card_professor.jsp");
			}else {
				view = false;
				response.sendRedirect("grafico.jsp");
			}
			
			break;
		case "numProfessores":
			view = false;
			int numProfessor = dao.numProfessores();
			response.getWriter().write(String.valueOf(numProfessor));
			break;
		case "formProfessor":
			p = new Professor(Long.parseLong(id));
			p = dao.buscarProfessor(p);
			request.setAttribute("professor", p);
			dispatcher = request.getRequestDispatcher("quest_professor.jsp");
			break;
		case "avaliar":
			String pontualidade = request.getParameter("pontualidade");
			String duvidas = request.getParameter("duvidas");
			String avaliacao = request.getParameter("avaliacao");
			String conhecimento = request.getParameter("conhecimento");
			String comentario = request.getParameter("comentario");
			p = new Professor(Long.parseLong(id));
			Votacao av = new Votacao(
				comentario,
				Integer.parseInt(pontualidade),
				Integer.parseInt(duvidas),
				Integer.parseInt(avaliacao),
				Integer.parseInt(conhecimento),
				p,
				aluno
			);
			String resultado = new DaoVotacao().salvar(av);
			view = false;
			if(resultado == "1") {
				response.getWriter().write("1");
				UltimaAvaliacao.atualizarAv();
			}else {
				response.getWriter().write("0");
			}
			break;
		case "mediaProfessor":
			view = false;
			List<Professor> profs = dao.listarProfessoresAtivos();
			String json = "";
			String inicio = "[", fim = "]";
			JSONObject jsonObj = new JsonManager().JsonGeneratorProfessor(profs);
			System.out.println(jsonObj.toString());
			for (Professor prof : profs) {
				List<Double> medias = dao.mediaProfessor(prof);
				json += "{\"nome\": \""+prof.getNome()+"\", \"media_pont\": "+medias.get(0)+", \"media_cla\": "+medias.get(1)+", \"media_mtd\": "+medias.get(2)+", \"media_conhe\": "+medias.get(3)+"},";
			}
			int tamanhoJson = json.length();
			String JsonFormatado = json.substring(0, tamanhoJson -1);
			response.getWriter().append(inicio+JsonFormatado+fim);
			break;
		case "ultimaAtt":
			view = false;
			JSONObject ultimaAtt = new JSONObject();
			SimpleDateFormat fmt = new SimpleDateFormat("dd/MM/yyyy HH:mm ss");
			ultimaAtt.put("ultimaAv", fmt.format(UltimaAvaliacao.getUltimaAvaliacao()));
			response.getWriter().append(ultimaAtt.toString());
			break;
		}
		if(dispatcher != null && view) {
			dispatcher.forward(request, response);
		}else if(dispatcher == null && !view){
		}else {
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao processar requisição");
		}
	}

}
