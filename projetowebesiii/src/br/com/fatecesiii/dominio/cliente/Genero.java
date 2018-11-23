package br.com.fatecesiii.dominio.cliente;

import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public class Genero extends EntidadeDominio {

	private String descricaoGenero;

	public String getDescricaoGenero() {
		return descricaoGenero;
	}

	public void setDescricaoGenero(String descricaoGenero) {
		this.descricaoGenero = descricaoGenero;
	}
}
