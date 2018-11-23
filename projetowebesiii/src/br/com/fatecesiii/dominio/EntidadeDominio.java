package br.com.fatecesiii.dominio;

import java.util.Date;

public class EntidadeDominio {

	private int id;
	private Date dataCadastro;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public Date getDataCadastro() {
		return dataCadastro;
	}
	
	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}	
}
