var numProfessores = 0;
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
		}
	});

	acao = "numProfessores";

	$.ajax({
		url: '/Satisfacao/votacao',
		type: 'POST',
		data: {acao: acao},
		success: function(rs){
			numProfessores = rs;
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

$(document).on('click', '#btn-enviar', function(){
	var pontualidade = $('input:radio[name=pontualidade]:checked').val();
	var duvidas = $('input:radio[name=duvidas]:checked').val();
	var avaliacao = $('input:radio[name=avaliacao]:checked').val();
	var conhecimento = $('input:radio[name=conhecimento]:checked').val();
	var comentario = $('#comentario').val();
	var validacao = validacaoForm(pontualidade, duvidas, avaliacao, conhecimento);

	if(validacao != 0){
		bootbox.alert("Responda todas as perguntas!");
		if(validacao == 1){
			$('#v1').append('<small class="text-danger"><i class="fas fa-exclamation-triangle"></i> Selecione</small>');
		}else if(validacao == 2){
			$('#v2').append('<small class="text-danger"><i class="fas fa-exclamation-triangle"></i> Selecione</small>');
		}else if(validacao == 3){
			$('#v3').append('<small class="text-danger"><i class="fas fa-exclamation-triangle"></i> Selecione</small>');
		}else if(validacao == 4){
			$('#v4').append('<small class="text-danger"><i class="fas fa-exclamation-triangle"></i> Selecione</small>');
		}
		return false;
	}

	var acao = "avaliar";
	var id = $(this).data("id");
	var params = {pontualidade, duvidas, avaliacao, conhecimento, acao, id, comentario};

	$.ajax({
		url: '/Satisfacao/votacao',
		type: 'POST',
		data: $.param(params),
		beforeSend: function(){
			$body = $("body");
			$body.addClass("loading");
		},
		success: function(rs){
			window.location.href = '/Satisfacao/questionario.jsp';
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

function validacaoForm(pontualidade, duvidas, avaliacao, conhecimento){
	if(pontualidade == null){
		return 1;
	}
	if(duvidas == null){
		return 2;
	}
	if(avaliacao == null){
		return 3;
	}
	if(conhecimento == null){
		return 4;
	}
	return 0;
}