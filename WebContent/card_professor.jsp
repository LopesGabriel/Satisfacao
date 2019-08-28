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
	<div id="ultimaAtt" class="card-footer text-muted text-center">
	  
	</div>
</div>

<script>
acao = "ultimaAtt";
$.ajax({
	url: '/Satisfacao/votacao',
	type: 'POST',
	dataType: 'JSON',
	data: {acao: acao},
	success: function(rs){
		$('#ultimaAtt').append("Ultima atualização: <b>" + rs.ultimaAv + " Segundos</b>");
	}
});
</script>
</html>