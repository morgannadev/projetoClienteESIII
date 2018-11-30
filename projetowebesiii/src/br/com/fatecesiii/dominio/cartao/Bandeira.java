package br.com.fatecesiii.dominio.cartao;

import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public class Bandeira extends EntidadeDominio {

	private String nomeBandeira;

	public String getNomeBandeira() {
		return nomeBandeira;
	}

	public void setNomeBandeira(String nomeBandeira) {
		this.nomeBandeira = nomeBandeira;
	}
}
