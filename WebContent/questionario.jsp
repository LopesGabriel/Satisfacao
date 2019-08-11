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
				<form action="votacao" method="post">
				  <!-- <div class="card-header">Featured</div> -->
				  <div class="card-body">
				    <h5 class="card-title mb-3 ml-5 text-dark">Qual nota você daria para o professor(a) no quisito de pontualidade?</h5>
				    <ul class="list-group pb-4 pt-4">
				    	<c:forEach items="${professores}" var="professor">
							<li class="list-group-item">
								<p class="text-uppercase text-center text-info"><b><c:out value="${professor.nome}"></c:out></b></p>
								<hr>
								<div class="d-flex justify-content-around">
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="${professor.matricula}1000" name="${professor.matricula}Pont" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="${professor.matricula}1000">1</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="${professor.matricula}2000" name="${professor.matricula}Pont" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="${professor.matricula}2000">2</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="${professor.matricula}3000" name="${professor.matricula}Pont" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="${professor.matricula}3000">3</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="${professor.matricula}4000" name="${professor.matricula}Pont" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="${professor.matricula}4000">4</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="${professor.matricula}5000" name="${professor.matricula}Pont" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="${professor.matricula}5000">5</label>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
					<h5 class="card-title mb-3 ml-5 text-dark">Qual nota você daria para o professor(a) no quisito de clareza?</h5>
					<ul class="list-group pb-4 pt-4">
				    	<c:forEach items="${professores}" var="professor">
							<li class="list-group-item">
								<p class="text-uppercase text-center text-info"><b><c:out value="${professor.nome}"></c:out></b></p>
								<hr>
								<div class="d-flex justify-content-around">
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="${professor.matricula}1100" name="${professor.matricula}Clar" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="${professor.matricula}1100">1</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="${professor.matricula}2200" name="${professor.matricula}Clar" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="${professor.matricula}2200">2</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="${professor.matricula}3300" name="${professor.matricula}Clar" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="${professor.matricula}3300">3</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="${professor.matricula}4400" name="${professor.matricula}Clar" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="${professor.matricula}4400">4</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="${professor.matricula}5500" name="${professor.matricula}Clar" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="${professor.matricula}5500">5</label>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
					<h5 class="card-title mb-3 ml-5 text-dark">Qual nota você daria para o professor(a) quanto ao seu método avaliativo?</h5>
					<ul class="list-group pb-4 pt-4">
				    	<c:forEach items="${professores}" var="professor">
							<li class="list-group-item">
								<p class="text-uppercase text-center text-info"><b><c:out value="${professor.nome}"></c:out></b></p>
								<hr>
								<div class="d-flex justify-content-around">
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="${professor.matricula}1110" name="${professor.matricula}Mtda" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="${professor.matricula}1110">1</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="${professor.matricula}2220" name="${professor.matricula}Mtda" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="${professor.matricula}2220">2</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="${professor.matricula}3330" name="${professor.matricula}Mtda" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="${professor.matricula}3330">3</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="${professor.matricula}4440" name="${professor.matricula}Mtda" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="${professor.matricula}4440">4</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="${professor.matricula}5550" name="${professor.matricula}Mtda" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="${professor.matricula}5550">5</label>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
					<h5 class="card-title mb-3 ml-5 text-dark">Qual nota você daria para o professor(a) Quanto ao seu conhecimento sobre a matéria?</h5>
					<ul class="list-group pb-4 pt-4">
				    	<c:forEach items="${professores}" var="professor">
							<li class="list-group-item">
								<p class="text-uppercase text-center text-info"><b><c:out value="${professor.nome}"></c:out></b></p>
								<hr>
								<div class="d-flex justify-content-around">
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="${professor.matricula}1111" name="${professor.matricula}Conhe" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="${professor.matricula}1111">1</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="${professor.matricula}2222" name="${professor.matricula}Conhe" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="${professor.matricula}2222">2</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="${professor.matricula}3333" name="${professor.matricula}Conhe" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="${professor.matricula}3333">3</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="${professor.matricula}4444" name="${professor.matricula}Conhe" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="${professor.matricula}4444">4</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" id="${professor.matricula}5555" name="${professor.matricula}Conhe" class="custom-control-input">
										<label style="cursor:pointer" class="custom-control-label" for="${professor.matricula}5555">5</label>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
					
				  </div>
				  <div class="card-footer d-flex justify-content-end">
				    <button type="submit" class="btn btn-primary pl-5 pr-5 mr-5">
				    	<i class="fas fa-paper-plane"></i> Enviar
				    </button>
				    <a href="#" class="btn btn-link mr-5">
				    	Cancelar
				    </a>
				  </div>
				  </form>
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