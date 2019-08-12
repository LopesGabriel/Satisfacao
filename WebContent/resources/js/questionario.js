$(document).ready(function(){
	var acao = "listarProfessores";
	var id = null;
	var params = {acao, id}
	$.ajax({
		url: '/Satisfacao/votacao',
		type: 'POST',
		data: $.param(params),
		beforeSend: function(){
			$body = $("body");
			$body.addClass("loading");
		},
		success: function(rs){
			$('#conteudo_form').append(rs);
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

$(document).on('click', '#btn-professor', function(){
	var acao = "formProfessor";
	var id = $(this).attr("data-id");
	var params = {acao, id}
	$.ajax({
		url: '/Satisfacao/votacao',
		type: 'POST',
		data: $.param(params),
		beforeSend: function(){
			$body = $("body");
			$body.addClass("loading");
		},
		success: function(rs){
			$('#perguntas_professor').empty();
			$('#perguntas_professor').append(rs);
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