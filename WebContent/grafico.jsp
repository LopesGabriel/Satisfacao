<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
									<a id="pont" class="nav-link active text-secondary" href="#" data-dado="pontualidade">Pontualidade</a>
								</li>
								<li class="nav-item">
									<a id="clar" class="nav-link text-secondary" href="#" data-dado="clareza">Clareza</a>
								</li>
								<li class="nav-item">
									<a id="aval" class="nav-link text-secondary" href="#" data-dado="mtdAvaliativo">Métodos avaliativos</a>
								</li>
								<li class="nav-item">
									<a id="conh" class="nav-link text-secondary" href="#" data-dado="conhecimento">Conhecimento sobre a matéria</a>
								</li>
						    </ul>
						</div>
						<div id="chart-place" class="card-body">

						</div>
						<div id="ultimaAtt" class="card-footer text-muted text-center">
						  
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
	var dados;
	var nomes = "";
	var nomesFormatado;
	var media_pon = [];
	var media_cla = [];
	var media_mtd = [];
	var media_conhe = [];
	var canvas = '<canvas id="grafico" class="col-12"></canvas>';
	$(document).ready(function(){
		
		acao = "ultimaAtt";
		$.ajax({
			url: '/Satisfacao/votacao',
			type: 'POST',
			dataType: 'JSON',
			data: {acao: acao},
			success: function(rs){
				$('#ultimaAtt').append("Ultima atualização: " + rs.ultimaAv + " Segundos</b>");
			}
		});
		
		acao = "mediaProfessor";
		var qtd = 0;
		
		$.ajax({
			url: '/Satisfacao/votacao',
			type: 'POST',
			dataType: 'JSON',
			data: {acao: acao},
			success: function(rs){
				dados = rs;
				qtd = Object.keys(rs).length;
				for(i = 0; i < qtd; i++){
					nomes += rs[i].nome + ",";
					media_pon.push(rs[i].media_pont);
					media_cla.push(rs[i].media_cla);
					media_mtd.push(rs[i].media_mtd);
					media_conhe.push(rs[i].media_conhe);
				}
				var tamanhoNomes = nomes.length;
				nomesFormatado = nomes.substring(0, tamanhoNomes -1);
				$('#chart-place').append(canvas);
				var chart = new Chart(document.getElementById("grafico"),{
					type: 'bar',
					data: {
						labels: nomesFormatado.split(','),
						datasets: [{
							label: "Média de Pontualidade",
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
							yAxes:[{
								display: true,
								ticks: {
									suggestedMin: 0,
									beginAtZero: true,
									maxTicksLimit: 6,
									stepSize: 6,
									Min: 0,
									Max: 5
								}
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

	$(document).on('click', '#pont', function(){
		$('#chart-place').empty();
		$('#pont').removeClass('active');
		$('#clar').removeClass('active');
		$('#aval').removeClass('active');
		$('#conh').removeClass('active');
		$('#pont').addClass('active');
		$('#chart-place').append(canvas);

		var chart = new Chart(document.getElementById("grafico"),{
			type: 'bar',
			data: {
				labels: nomesFormatado.split(','),
				datasets: [{
					label: "Média de Pontualidade.",
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
					yAxes:[{
						display: true,
						ticks: {
							suggestedMin: 0,
							beginAtZero: true
						}
					}]
				}
			}
		});

	});

	$(document).on('click', '#clar', function(){
		$('#chart-place').empty();
		$('#pont').removeClass('active');
		$('#clar').removeClass('active');
		$('#aval').removeClass('active');
		$('#conh').removeClass('active');
		$('#clar').addClass('active');
		$('#chart-place').append(canvas);

		var chart = new Chart(document.getElementById("grafico"),{
			type: 'bar',
			data: {
				labels: nomesFormatado.split(','),
				datasets: [{
					label: "Média de Clareza.",
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
					data: media_cla
				}]
			},
			options: {
				scales: {
					yAxes:[{
						display: true,
						ticks: {
							suggestedMin: 0,
							beginAtZero: true
						}
					}]
				}
			}
		});

	});

	$(document).on('click', '#aval', function(){
		$('#chart-place').empty();
		$('#pont').removeClass('active');
		$('#clar').removeClass('active');
		$('#aval').removeClass('active');
		$('#conh').removeClass('active');
		$('#aval').addClass('active');
		$('#chart-place').append(canvas);

		var chart = new Chart(document.getElementById("grafico"),{
			type: 'bar',
			data: {
				labels: nomesFormatado.split(','),
				datasets: [{
					label: "Média do Método de avaliação.",
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
					data: media_mtd
				}]
			},
			options: {
				scales: {
					yAxes:[{
						display: true,
						ticks: {
							suggestedMin: 0,
							beginAtZero: true
						}
					}]
				}
			}
		});

	});

	$(document).on('click', '#conh', function(){
		$('#chart-place').empty();
		$('#pont').removeClass('active');
		$('#clar').removeClass('active');
		$('#aval').removeClass('active');
		$('#conh').removeClass('active');
		$('#conh').addClass('active');
		$('#chart-place').append(canvas);

		var chart = new Chart(document.getElementById("grafico"),{
			type: 'bar',
			data: {
				labels: nomesFormatado.split(','),
				datasets: [{
					label: "Média de conhecimento",
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
					data: media_conhe
				}]
			},
			options: {
				scales: {
					yAxes:[{
						display: true,
						ticks: {
							suggestedMin: 0,
							beginAtZero: true
						}
					}]
				}
			}
		});

	});

	</script>
  
</body>
</html>