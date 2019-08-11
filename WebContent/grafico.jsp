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
	
			<div class="mt-3 container-fluid">
				<nav aria-label="breadcrumb">
				  <ol class="breadcrumb">
				    <li class="breadcrumb-item"><a href="#">Home</a></li>
				    <li class="breadcrumb-item active" aria-current="page">Gráficos</li>
				  </ol>
				</nav>
			
				<div class="container">
					<div class="card">
						<div class="card-header">
							<ul class="nav nav-tabs card-header-tabs">
								<li class="nav-item">
									<a class="nav-link active text-secondary" href="#">Pontualidade</a>
								</li>
								<li class="nav-item">
									<a class="nav-link text-secondary" href="#">Clareza</a>
								</li>
								<li class="nav-item">
									<a class="nav-link text-secondary" href="#">Métodos avaliativos</a>
								</li>
								<li class="nav-item">
									<a class="nav-link text-secondary" href="#">Conhecimento sobre a matéria</a>
								</li>
						    </ul>
						</div>
						<div class="card-body">
							<canvas id="pieChart"></canvas>
							<hr>
							<p class="card-text">Esse gráfico apresenta o desempenho de cada professor quanto a sua pontualidade nas aulas.</p>
						</div>
						<div class="card-footer text-muted text-center">
						  Última atualização: 12/08/2019 14:00
						</div>
					</div>
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
	
	<script>
	var chart = new Chart(document.getElementById("pieChart"),{
		type: 'pie',
		data: {
			labels: ["Rodrigo", "Alfredo", "Fabiano", "Suami", "Mamede"],
			datasets: [{
				label: "My First dataset",
				backgroundColor: [
	                'rgba(255, 99, 132, 0.7)',
	                'rgba(54, 162, 235, 0.7)',
	                'rgba(255, 206, 86, 0.7)',
	                'rgba(75, 192, 192, 0.7)',
	                'rgba(153, 102, 255, 0.7)'
	            ],
				borderColor: [
	                '#333',
	                '#333',
	                '#333',
	                '#333',
	                '#333',
	            ],
	            borderWidth: 1,
				data: [0, 2, 5, 4, 3]
			}]
		},
		options: {}
	});
	</script>
  
</body>
</html>