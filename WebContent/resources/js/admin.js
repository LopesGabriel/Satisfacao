$(document).ready(function(){
	$.ajax({
		url: '/Satisfacao/professor',
		dataType: 'JSON',
		type: 'GET',
		beforeSend: function(){
			$body = $("body");
			$body.addClass("loading");
		},
		success: function(rs){
			var count = Object.keys(rs).length;
			for(var i = 0; i < count; i++){
				var cor;
				if(rs[i].sit == true){
					cor = "text-success";
				}else{
					cor = "text-muted";
				}
				var tr = '<tr>'+
							'<td>'+rs[i].nome+'</td>'+
							'<td>'+rs[i].matricula+'</td>'+
							'<td>'+rs[i].disciplina+'</td>'+
							'<td class="text-center"><a href="#" class="text-decoration-none '+cor+'" onclick="situacao('+rs[i].id+')"><i class="fas fa-user"></i></a></td>'+
						'</tr>';
				$('#professores').append(tr);
			}
		},
		complete: function(){
			$body.removeClass("loading");
		}
	});
});

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
		type: 'POST',
		data: $.param(params),
		beforeSend: function(){
			$body = $("body");
			$body.addClass("loading");
		},
		success: function(rs){
			switch(rs){
			case "0":
				bootbox.alert("Erro interno, tente novamente mais tarde.");
				break;
			case "1":
				$(location).attr('href', '/Satisfacao/admin.jsp');
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
		},
		complete: function(){
			$body.removeClass("loading");
		}
	});

});

function situacao(id){

	var params = {id};

	$.ajax({
		url: '/Satisfacao/home',
		type: 'POST',
		data: $.param(params),
		beforeSend: function(){
			$body = $("body");
			$body.addClass("loading");
		},
		success: function(rs){
			switch(rs){
			case "0":
				bootbox.alert("Erro interno, tente novamente mais tarde.");
				break;
			case "1":
				$(location).attr('href', '/Satisfacao/admin.jsp');
				break;
			}
		},
		error: function(xhr, er){
			$body.removeClass("loading");
			bootbox.alert({
				size: 'small',
				title: 'Erro: '+ xhr.status +' '+ xhr.statusText,
				message: er
			});
		},
		complete: function(){
			$body.removeClass("loading");
		}
	});
}