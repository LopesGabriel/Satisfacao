<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

	<!-- head -->
	<jsp:include page="./core/head.jsp"></jsp:include>
	<!-- fim head -->

<body>

	<div class="d-flex" id="wrapper">

		<!-- Sidebar -->
		<%-- <jsp:include page="./componentes/sidebar.jsp"></jsp:include> --%>
		<!-- fim sidebar -->
	
		<!-- Page Content -->
		<div id="page-content-wrapper">
	
			<!-- Header -->
			<jsp:include page="./componentes/header.jsp"></jsp:include>
			<!-- Fim header -->

			<section class="container-fluid page-section">
				<h1 class="text-center Roboto">Sistema de avaliação do corpo docente.</h1>
				<div class="col-12 col-md-10 col-lg-8 mx-auto mt-5 mb-3 pl-2 pr-2">
					<h3 class="Roboto mb-3">Objetivo</h3>
					<p class="text-justify Roboto">
						Este projeto tem o objetivo de realizar um melhor processamento dos dados obtidos através
						da pesquisa de satisfação, que será respondida pelos alunos matriculados no curso de Análise e
						Desenvolvimento de Sistemas.
					</p>
					<hr class="my-4">
					<h3 class="Roboto mb-3">Regras de negócio</h3>
					<p class="text-justify Roboto">
						Cada Aluno poderá enviar uma pesquisa, para que seja válido o aluno deverá informar seu nome, matrícula
						e semestre. Os gráficos somente serão disponibilizados após o preenchimento e envio do formulário.
					</p>
					<hr class="my-4">
					<h3 class="Roboto mb-3">Como utilizar</h3>
					<p class="text-justify Roboto">
						1º - O Usuário deverá informar seus dados na página inícial para depois ser redirecionado
						para a página do formulário de satisfação ou para a página dos gráficos.
					</p>
					<p class="text-justify Roboto">
						2º - Após ser redirecionado para a página do formulário, deverá preencher os campos de acordo com 
						sua opinião, então após a confirmação você será redirecionado para a página de gráficos.
					</p>
					<p class="text-justify Roboto">
						3º - Na página de gráficos, você terá a liberdade de navegar entre os diferentes tipos de gráficos e
						estatisticas geradas pelo sistema.
					</p>
				</div>
			</section>
	
			<section class="container-fluid bg-light shadow page-section">
				<div class="form-row col-12 col-md-10 col-lg-8 mx-auto">
					<div class="row col-12 mb-5 d-flex justify-content-center">
					<h2 class="Roboto col-12 text-center">Informe seus dados</h2>
					<small class="text-muted">Todos os campos são obrigatórios.</small>
					</div>
					<div class="form-group col-12 col-md-6 col-lg-4">
						<label for="nome">Nome</label>
						<input id="nome" type="text" class="form-control" placeholder="Nome" required>
					</div>
					<div class="form-group col-12 col-md-6 col-lg-4">
						<label for="mat">Matrícula</label>
						<input id="mat" type="text" class="form-control" placeholder="Matrícula" required>
					</div>
					<div class="form-group col-12 col-md-6 col-lg-4">
						<label for="sem">Semestre</label>
						<select id="sem" class="form-control">
							<option value="1">1º Semestre</option>
							<option value="2">2º Semestre</option>
							<option value="3">3º Semestre</option>
							<option value="4">4º Semestre</option>
						</select>
					</div>
					<div class="col-12 d-flex justify-content-center">
						<button id="btn-iniciar-avaliacao" class="btn btn-primary">Iniciar avaliação</button>
					</div>
				</div>
			</section>
		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Footer -->
	<jsp:include page="./core/footer.jsp"></jsp:include>
	<!-- fim footer -->
	
	<!-- Page script -->
	<script src="./resources/js/aluno.js"></script>
  
</body>
</html>