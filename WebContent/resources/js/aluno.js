$(document).ready(function(){
	$(".load").hide();
});

$("#btn-iniciar-avaliacao").on('click', function(){
	var nome = $('#nome').val();
	var mat = $('#mat').val();
	var sem = $('#sem').val();
	var params = {nome, mat, sem};

	$.ajax({
		url: '/Satisfacao/identificacao',
		type: 'POST',
		data: $.param(params),
		beforeSend: function(){
			$(".load").fadeIn(500);
		},
		success: function(rs){
			switch(rs){
			case "0":
				alert("Erro ao salvar dados.");
				break;
			case "1":
				alert("Dados salvos no banco de dados.");
				break;
			case "2":
				$(".load").fadeOut(500);
				alert("Você já realizou uma avaliação!");
				break;
			}
		},
		error: function(xhr, er){
			alert("Erro: "+ xhr.status + " " + er + " - " + xhr.statusText)
		}
	});

});