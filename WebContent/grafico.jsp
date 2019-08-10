<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
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
	
			<div class="container-fluid">
				<h1 class="mt-4">Graficos</h1>
				<div class="container">
					<canvas id="pieChart"></canvas>
				</div>
			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Footer -->
	<jsp:include page="./core/footer.jsp"></jsp:include>
	<!-- fim footer -->
	
	<script>
	var chart = new Chart(document.getElementById("pieChart"),{
		type: 'line',
		data: {
			labels: ["Rodrigo", "Alfredo", "Fabiano", "Suami", "Mamede"],
			datasets: [{
				label: "My First dataset",
				backgroundColor: 'rgb(255,99,132)',
				borderColor: 'rgb(255,99,132)',
				data: [0, 2, 5, 4, 3]
			}]
		},
		options: {}
	})
	</script>
  
</body>
</html>