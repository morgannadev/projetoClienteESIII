package br.com.fatecesiii.dominio.cliente;

import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public class TipoTelefone extends EntidadeDominio {

	private String descricaoTipoTelefone;

	public String getDescricaoTipoTelefone() {
		return descricaoTipoTelefone;
	}

	public void setDescricaoTipoTelefone(String descricaoTipoTelefone) {
		this.descricaoTipoTelefone = descricaoTipoTelefone;
	}
}
