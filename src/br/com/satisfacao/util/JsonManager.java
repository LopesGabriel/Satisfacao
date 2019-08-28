package br.com.satisfacao.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import br.com.satisfacao.dao.DaoProfessor;
import br.com.satisfacao.models.Professor;

public class JsonManager {
	
	private DaoProfessor dao = new DaoProfessor();
	
	public JSONObject JsonGeneratorProfessor(List<Professor> professores) {

		JSONObject json = new JSONObject();
		JSONArray nomes = new JSONArray();
		JSONArray mPontualidade = new JSONArray();
		JSONArray mClareza = new JSONArray();
		JSONArray mMetodoDeAvaliacao = new JSONArray();
		JSONArray mConhecimento = new JSONArray();

		for (Professor p : professores) {
			List<Double> medias = dao.mediaProfessor(p);
			nomes.put(p.getNome());
			mPontualidade.put(medias.get(0));
			mClareza.put(medias.get(1));
			mMetodoDeAvaliacao.put(medias.get(2));
			mConhecimento.put(medias.get(3));
		}

		return json;
	}

}
