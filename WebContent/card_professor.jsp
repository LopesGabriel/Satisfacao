<%@page import="br.com.satisfacao.models.Aluno"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% Aluno al = (Aluno) session.getAttribute("aluno"); %>
<!DOCTYPE html>
<html lang="pt-br">
<!-- Card Formulário -->
<div class="card">
	<div class="card-header">
		<ul class="nav nav-tabs card-header-tabs">
			<c:forEach items="${professores}" var="prof">
				<li class="nav-item">
					<a id="btn-professor" data-id="${prof.id}" class="nav-link text-secondary" href="#"> ${prof.nome} </a>
				</li>
			</c:forEach>
	    </ul>
	</div>
	<div id="perguntas_professor" class="card-body">
		<h1 class="text-info text-center"><%= al.getNome() %>, selecione um professor!</h1>
	</div>
	<div class="card-footer text-muted text-center">
	  Última avaliação em <b>12/08/2019 14:00</b>
	</div>
</div>
</html>