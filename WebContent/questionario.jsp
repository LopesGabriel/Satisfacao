<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pt-br">

	<!-- head -->
	<jsp:include page="./core/head.jsp"></jsp:include>
	<!-- fim head -->

<body class="bg-light">
	<div class="carregando"></div>
	<div class="d-flex" id="wrapper">

		<!-- Page Content -->
		<div id="page-content-wrapper">

			<!-- Header -->
			<jsp:include page="./componentes/header.jsp"></jsp:include>
			<!-- Fim header -->

			<section class="page-section mt-3">
				<h1 class="text-center mb-3 Roboto">Avaliação do corpo docente</h1>
				<!-- Div que será inserida os formulários -->
				<div id="conteudo_form" class="col-12 col-md-10 col-lg-8 col-xl-6 mx-auto">
				</div>
			</section>

		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Footer -->
	<jsp:include page="./core/footer.jsp"></jsp:include>
	<!-- fim footer -->

	<!-- Questionario JS -->
	<script src="./resources/js/questionario.js"></script>
</body>
</html>