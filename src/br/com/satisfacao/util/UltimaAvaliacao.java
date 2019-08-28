package br.com.satisfacao.util;

import java.util.Date;

public class UltimaAvaliacao {
	
	private static Date ultimaAvaliacao = null;
	
	static {
		atualizarAv();
	}
	
	public UltimaAvaliacao() {
		atualizarAv();
	}

	public static Date getUltimaAvaliacao() {
		return ultimaAvaliacao;
	}

	public static void setUltimaAvaliacao(Date ultimaAvaliacao) {
		UltimaAvaliacao.ultimaAvaliacao = ultimaAvaliacao;
	}

	public static void atualizarAv() {
		Date agora = new Date();
		ultimaAvaliacao = agora;
	}

}
