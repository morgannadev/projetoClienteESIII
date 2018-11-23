package br.com.fatecesiii.dominio.endereco;

import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public class Bairro extends EntidadeDominio {

	private String bairro;
	private Cidade cidade;
	
	public String getBairro() {
		return bairro;
	}
	
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	
	public Cidade getCidade() {
		return cidade;
	}
	
	public void setCidade(Cidade cidade) {
		this.cidade = cidade;
	}
}
