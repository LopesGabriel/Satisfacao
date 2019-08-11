package br.com.satisfacao.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.satisfacao.dao.DaoProfessor;
import br.com.satisfacao.models.Professor;

@WebServlet("/home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DaoProfessor dao = new DaoProfessor();
       
    public Home() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("id");
		Professor uidP = new Professor();
		uidP.setId(Long.parseLong(uid));
		Professor p = dao.buscarProfessor(uidP);
		if(p.isAtivo()) {
			p.setAtivo(false);
		}else {
			p.setAtivo(true);
		}
		String retorno = dao.atualizar(p);
		
		if(retorno != "1") {
			response.getWriter().write("0");
		}else {
			response.getWriter().write("1");
		}
		return;
	}

}
