<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

	<!-- head -->
	<jsp:include page="./core/head.jsp"></jsp:include>
	<!-- fim head -->
	
<body>

	<div class="d-flex" id="wrapper">
	
		<!-- Page Content -->
		<div id="page-content-wrapper">
	
			<!-- Header -->
			<jsp:include page="./componentes/header.jsp"></jsp:include>
			<!-- Fim header -->
	
			<div class="container-fluid">

				<!-- Formulário de registro professor -->
				<div class="col-11 col-md-10 col-lg-8 rounded form-row bg-light p-3 shadow mx-auto mt-4">
					<h1 class="col-12 Roboto text-center">Incluir professor</h1>
					<div class="form-group col-12 col-md-6 col-lg-4">
						<label for="nome">Nome</label>
						<input id="nome" type="text" class="form-control" placeholder="Nome">
					</div>
					<div class="form-group col-12 col-md-6 col-lg-4">
						<label for="disc">Disciplina <i class="fas fa-book"></i></label>
						<input id="disc" type="text" class="form-control" placeholder="Disciplina">
					</div>
					<div class="form-group col-12 col-md-6 col-lg-4">
						<label for="mat">Matrícula <i class="far fa-id-card"></i></label>
						<input id="mat" type="text" class="form-control" placeholder="Matrícula">
					</div>
					<div class="col-12 d-flex justify-content-center">
						<button id="btn-registrar-professor" class="btn btn-primary">Registrar professor</button>
					</div>
				</div>
				<!-- Fim Formulário -->

				<section class="page-section mt-5 bg-light col-12">
					<h1 class="text-center Roboto">Quem respondeu?</h1>
				</section>
			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Footer -->
	<jsp:include page="./core/footer.jsp"></jsp:include>
	<!-- fim footer -->
	
	<script src="./resources/js/admin.js"></script>
  
</body>
</html>