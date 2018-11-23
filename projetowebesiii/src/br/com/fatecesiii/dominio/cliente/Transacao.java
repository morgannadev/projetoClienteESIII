package br.com.fatecesiii.dominio.cliente;

import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public class Transacao extends EntidadeDominio {
	
	private String transacao;

	public String getTransacao() {
		return transacao;
	}

	public void setTransacao(String transacao) {
		this.transacao = transacao;
	}	
}
