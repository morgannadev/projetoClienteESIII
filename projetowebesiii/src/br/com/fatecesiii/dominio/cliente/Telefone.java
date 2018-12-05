package br.com.fatecesiii.dominio.cliente;

import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public class Telefone extends EntidadeDominio {

	private TipoTelefone tipoTelefone;
	private int ddd;
	private String numeroTelefone;
	
	public TipoTelefone getTipoTelefone() {
		return tipoTelefone;
	}
	
	public void setTipoTelefone(TipoTelefone tipoTelefone) {
		this.tipoTelefone = tipoTelefone;
	}
	
	public int getDdd() {
		return ddd;
	}
	
	public void setDdd(int ddd) {
		this.ddd = ddd;
	}
	
	public String getNumeroTelefone() {
		return numeroTelefone;
	}
	
	public void setNumeroTelefone(String numeroTelefone) {
		this.numeroTelefone = numeroTelefone;
	}
}
