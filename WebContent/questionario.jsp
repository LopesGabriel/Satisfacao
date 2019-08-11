<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="pt-br">

	<!-- head -->
	<jsp:include page="./core/head.jsp"></jsp:include>
	<!-- fim head -->
	
<body>

	<div class="d-flex" id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="./componentes/sidebar.jsp"></jsp:include>
		<!-- fim sidebar -->
	
		<!-- Page Content -->
		<div id="page-content-wrapper">
	
			<!-- Header -->
			<jsp:include page="./componentes/header.jsp"></jsp:include>
			<!-- Fim header -->
	
			<div class="mt-3 container-fluid">
				<nav aria-label="breadcrumb">
				  <ol class="breadcrumb">
				    <li class="breadcrumb-item" aria-current="page"><a href="#">Home</a></li>
				    <li class="breadcrumb-item active" aria-current="page">Formulário de satisfação</li>
				  </ol>
				</nav>
				
				
				<div class="card">
				  <!-- <div class="card-header">Featured</div> -->
				  <div class="card-body">
				    <h5 class="card-title">Qual nota você daria para o professor(a) no quisito de pontualidade?</h5>
				    <ul class="list-group mb-4 mt-4">
				    	<c:forEach items="${professores}" var="professor">
							<li class="list-group-item">
								<p class="text-uppercase text-center"><b><c:out value="${professor.nome}"></c:out></b></p>
								<hr>
								<div class="d-flex justify-content-around">
									<div class="custom-control custom-radio custom-control-inline" style="cursor:pointer">
										<input type="radio" id="customRadioInline1" name="${professor.matricula}Pont" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="customRadioInline1">1</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline" style="cursor:pointer">
										<input type="radio" id="customRadioInline2" name="${professor.matricula}Pont" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="customRadioInline2">2</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline" style="cursor:pointer">
										<input type="radio" id="customRadioInline3" name="${professor.matricula}Pont" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="customRadioInline3">3</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline" style="cursor:pointer">
										<input type="radio" id="customRadioInline4" name="${professor.matricula}Pont" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="customRadioInline4">4</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline" style="cursor:pointer">
										<input type="radio" id="customRadioInline5" name="${professor.matricula}Pont" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="customRadioInline5">5</label>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
					<h5 class="card-title">Qual nota você daria para o professor(a) no quisito de clareza?</h5>
					<h5 class="card-title">Qual nota você daria para o professor(a) quanto ao seu método avaliativo?</h5>
					<h5 class="card-title">Qual nota você daria para o professor(a) Quanto ao seu conhecimento sobre a matéria?</h5>
				  </div>
				  <div class="card-footer">
				    <button type="submit" class="btn btn-primary">
				    	<i class="fas fa-paper-plane"></i> Enviar
				    </button>
				    <a href="#" class="btn btn-link">
				    	Cancelar
				    </a>
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
  
</body>
</html>