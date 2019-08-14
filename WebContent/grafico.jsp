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

	<!-- /#wrapper -->

	<!-- Footer -->
	<jsp:include page="./core/footer.jsp"></jsp:include>
	<!-- fim footer -->
	
	<script>
	$(document).ready(function(){
		acao = "mediaProfessor";
		var qtd = 0;
		var media_pon = [];
		var media_cla = [];
		var media_mtd = [];
		var media_conhe = [];
		
		$.ajax({
			url: '/Satisfacao/votacao',
			type: 'POST',
			dataType: 'JSON',
			data: {acao: acao},
			success: function(rs){
				console.log(rs);
				qtd = Object.keys(rs).length;
				var nomes = "";
				for(i = 0; i < qtd; i++){
					nomes += rs[i].nome + ",";
					media_pon.push(rs[i].media_pont);
					media_cla.push(rs[i].media_cla);
					media_mtd.push(rs[i].media_mtd);
					media_conhe.push(rs[i].media_conhe);
				}
				var tamanhoNomes = nomes.length;
				var nomesFormatado = nomes.substring(0, tamanhoNomes -1);
				var chart = new Chart(document.getElementById("pieChart"),{
					type: 'bar',
					data: {
						labels: nomesFormatado.split(','),
						datasets: [{
							label: "Média da Pontualidade dos professores.",
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
							data: media_pon
						}]
					},
					options: {
						scales: {
					        yAxes: [{
					            beginAtZero: true
					        }]
					    }
					}
				});
			},
			error: function(xhr, erro){
				$body.removeClass("loading");
				bootbox.alert({
					size: 'small',
					title: 'Erro: '+ xhr.status +' '+ xhr.statusText,
					message: erro
				});
			},
			complete: function(){
				$body.removeClass("loading");
			}
		});

	});
	</script>
  
</body>
</html>