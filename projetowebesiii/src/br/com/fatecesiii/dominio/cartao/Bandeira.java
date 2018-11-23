package br.com.fatecesiii.dominio.cartao;

import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public class Bandeira extends EntidadeDominio {

	private String nome;

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
}
