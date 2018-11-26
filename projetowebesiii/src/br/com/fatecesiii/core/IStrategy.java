package br.com.fatecesiii.core;

import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public interface IStrategy {

	public String processar(EntidadeDominio entidade);
}
