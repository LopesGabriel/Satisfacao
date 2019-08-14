<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="pt-br">

<!-- Div das perguntas -->
<div class="col-12 mx-auto">
	<h3 class="Roboto text-info">Pontualidade do professor:</h3>
	<!-- Div das opções -->
	<div id="v1" class="col-12 d-flex justify-content-center mx-auto">
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="pontualidade" id="pontualidade1" value="1">
			<label class="form-check-label" for="pontualidade1">1</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="pontualidade" id="pontualidade2" value="2">
			<label class="form-check-label" for="pontualidade2">2</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="pontualidade" id="pontualidade3" value="3">
			<label class="form-check-label" for="pontualidade3">3</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="pontualidade" id="pontualidade4" value="4">
			<label class="form-check-label" for="pontualidade4">4</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="pontualidade" id="pontualidade5" value="5">
			<label class="form-check-label" for="pontualidade5">5</label>
		</div>
	</div>
</div>
<hr>
<div class="col-12 mx-auto">
	<h3 class="Roboto text-info">O professor sanou todas as duvidas?</h3>
	<!-- Div das opções -->
	<div id="v2" class="col-12 d-flex justify-content-center mx-auto">
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="duvidas" id="duvidas1" value="1">
			<label class="form-check-label" for="duvidas1">1</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="duvidas" id="duvidas2" value="2">
			<label class="form-check-label" for="duvidas2">2</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="duvidas" id="duvidas3" value="3">
			<label class="form-check-label" for="duvidas3">3</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="duvidas" id="duvidas4" value="4">
			<label class="form-check-label" for="duvidas4">4</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="duvidas" id="duvidas5" value="5">
			<label class="form-check-label" for="duvidas5">5</label>
		</div>
	</div>
</div>
<hr>
<div class="col-12 mx-auto">
	<h3 class="Roboto text-info">Método de avaliação do professor:</h3>
	<!-- Div das opções -->
	<div id="v3" class="col-12 d-flex justify-content-center mx-auto">
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="avaliacao" id="avaliacao1" value="1">
			<label class="form-check-label" for="duvidas1">1</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="avaliacao" id="avaliacao2" value="2">
			<label class="form-check-label" for="avaliacao2">2</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="avaliacao" id="avaliacao3" value="3">
			<label class="form-check-label" for="avaliacao3">3</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="avaliacao" id="avaliacao4" value="4">
			<label class="form-check-label" for="avaliacao4">4</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="avaliacao" id="avaliacao5" value="5">
			<label class="form-check-label" for="avaliacao5">5</label>
		</div>
	</div>
</div>
<hr>
<div class="col-12 mx-auto">
	<h3 class="Roboto text-info">Conhecimento do professor sobre a matéria:</h3>
	<!-- Div das opções -->
	<div id="v4" class="col-12 d-flex justify-content-center mx-auto">
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="conhecimento" id="conhecimento1" value="1">
			<label class="form-check-label" for="conhecimento1">1</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="conhecimento" id="conhecimento2" value="2">
			<label class="form-check-label" for="conhecimento2">2</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="conhecimento" id="conhecimento3" value="3">
			<label class="form-check-label" for="conhecimento3">3</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="conhecimento" id="conhecimento4" value="4">
			<label class="form-check-label" for="conhecimento4">4</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="conhecimento" id="conhecimento5" value="5">
			<label class="form-check-label" for="conhecimento5">5</label>
		</div>
	</div>
</div>
<hr>
<div class="col-12 mx-auto">
	<h3 class="Roboto text-info">Deixe um comentário sobre o professor:</h3>
	<div class="form-group col-12 mx-auto">
		<textarea id="comentario" rows="5" placeholder="Comentário / Observação" class="form-control col-12"></textarea>
	</div>
</div>
<hr>
<small class="card-text Roboto">Lembre-se de marcar todas as opções antes de confirmar.</small>
<div class="col-12 d-flex justify-content-center">
	<button id="btn-enviar" data-id="${professor.id}" class="btn btn-primary mr-3">
		<i class="far fa-paper-plane"></i> Enviar
	</button>
	<button id="btn-cancelar" class="btn btn-danger">
		<i class="far fa-times-circle"></i> Cancelar
	</button>
</div>
</html>