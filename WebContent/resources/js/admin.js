$('#btn-registrar-professor').on('click', function(){
	var nome = $('#nome').val();
	var disc = $('#disc').val();
	var mat = $('#mat').val();
	
/*	var validacao = validacoes(nome, disc, mat);
	
	switch(validacao){
	case "1":
		bootbox.alert("Informe o nome!");
		return false;
		break;
	}*/
	
	var params = {nome, disc, mat};

	$.ajax({
		url: '/Satisfacao/professor',
		type: 'GET',
		data: $.param(params),
		beforeSend: function(){
			dialog.modal('show');
		},
		success: function(rs){
			switch(rs){
			case "0":
				bootbox.alert("Erro interno, tente novamente mais tarde.");
				break;
			case "1":
				bootbox.alert("Respondeu 1");
				break;
			case "2":
				bootbox.alert("Respondeu 2");
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