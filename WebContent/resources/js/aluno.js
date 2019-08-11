$("#btn-iniciar-avaliacao").on('click', function(){
	var nome = $('#nome').val();
	var mat = $('#mat').val();
	var sem = $('#sem').val();
	
	var validacao = validacoes(nome, mat, sem);
	
	switch(validacao){
	case "1":
		bootbox.alert("Informe seu nome!");
		return false;
		break;
	case "2":
		bootbox.alert("Nome deve conter no mínimo 2 caracteres!");
		return false;
		break;
	case "3":
		bootbox.alert("Informe sua matrícula!");
		return false;
		break;
	case "4":
		bootbox.alert("A Matricula deve conter 11 Números!");
		return false;
		break;
	case "5":
		bootbox.alert("Selecione um semestre!");
		return false;
		break;
	}
	
	var params = {nome, mat, sem};

	$.ajax({
		url: '/Satisfacao/identificacao',
		type: 'POST',
		data: $.param(params),
		beforeSend: function(){
			dialog.modal('show');
		},
		success: function(rs){
			switch(rs){
			case "0":
				bootbox.alert("Erro ao salvar dados.");
				break;
			case "1":
				window.location.pathname = "/Satisfacao/questionario.jsp";
				break;
			case "2":
				window.location.pathname = "/Satisfacao/grafico.jsp";
				break;
			}
		},
		error: function(xhr, er){
			dialog.modal('hide');
			bootbox.alert({
				size: 'small',
				title: 'Erro: '+ xhr.status +' '+ xhr.statusText,
				message: er
			});
		}
	});

});

function validacoes(nome, mat, sem){
	if(nome == "" || nome == null){
		dialog.modal('hide');
		return "1";
	}else if(nome.length < 2){
		dialog.modal('hide');
		return "2";
	}else if(mat == "" || mat == null){
		dialog.modal('hide');
		return "3";
	}else if(mat.length < 11){
		dialog.modal('hide');
		return "4";
	}else if(sem == "" || sem == null){
		dialog.modal('hide');
		return "5"
	}
	return true;
}