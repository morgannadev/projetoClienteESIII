package br.com.fatecesiii.core.implementacao.negocio;

import java.util.Date;

import br.com.fatecesiii.core.IStrategy;
import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public class ComplementarDataCadastro implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		
		if (entidade != null) {			
			Date data = new Date();
			entidade.setDataCadastro(data);
		} else {			
			return "Entidade " + entidade.getClass().getCanonicalName() + " nula!";
		}
		
		return null;
	}
}
