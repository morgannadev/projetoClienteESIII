package br.com.fatecesiii.dominio.endereco;

import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public class Estado extends EntidadeDominio {

	private String estado;
	private Pais pais;
	
	public String getEstado() {
		return estado;
	}
	
	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	public Pais getPais() {
		return pais;
	}
	
	public void setPais(Pais pais) {
		this.pais = pais;
	}
}
