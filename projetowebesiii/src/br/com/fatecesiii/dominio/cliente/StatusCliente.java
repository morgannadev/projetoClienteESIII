package br.com.fatecesiii.dominio.cliente;

import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public class StatusCliente extends EntidadeDominio {

	private String statusCliente;

	public String getStatusCliente() {
		return statusCliente;
	}

	public void setStatusCliente(String statusCliente) {
		this.statusCliente = statusCliente;
	}
}
