package br.com.fatecesiii.dominio.cartao;

import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public class Cartao extends EntidadeDominio {

	private boolean isPreferencial;
	private String numero;
	private String nomeImpressoCartao;
	private String codigoSeguranca;
	private Bandeira bandeira;
	
	public boolean isPreferencial() {
		return isPreferencial;
	}
	
	public void setPreferencial(boolean isPreferencial) {
		this.isPreferencial = isPreferencial;
	}
	
	public String getNumero() {
		return numero;
	}
	
	public void setNumero(String numero) {
		this.numero = numero;
	}
	
	public String getNomeImpressoCartao() {
		return nomeImpressoCartao;
	}
	
	public void setNomeImpressoCartao(String nomeImpressoCartao) {
		this.nomeImpressoCartao = nomeImpressoCartao;
	}
	
	public String getCodigoSeguranca() {
		return codigoSeguranca;
	}
	
	public void setCodigoSeguranca(String codigoSeguranca) {
		this.codigoSeguranca = codigoSeguranca;
	}
	
	public Bandeira getBandeira() {
		return bandeira;
	}
	
	public void setBandeira(Bandeira bandeira) {
		this.bandeira = bandeira;
	}	
}
