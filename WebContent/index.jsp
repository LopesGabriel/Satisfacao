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
		<div class="load align-middle text-center"><i class="fas fa-cog fa-spin fa-5x"></i></div>
		<div id="page-content-wrapper">
	
			<!-- Header -->
			<jsp:include page="./componentes/header.jsp"></jsp:include>
			<!-- Fim header -->
	
			<div class="container-fluid">
				<h1 class="mt-4 text-center">Identifique-se!</h1>
				<div class="form-row">
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
			</div>
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