package br.com.fatecesiii.dominio.cartao;

import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public class Cartao extends EntidadeDominio {

	private boolean isPreferencial;
	private String numeroCartao;
	private String nomeImpressoCartao;
	private String codigoSeguranca;
	private Bandeira bandeira;
	
	public boolean isPreferencial() {
		return isPreferencial;
	}
	
	public void setPreferencial(boolean isPreferencial) {
		this.isPreferencial = isPreferencial;
	}
	
	public String getNumeroCartao() {
		return numeroCartao;
	}
	
	public void setNumeroCartao(String numeroCartao) {
		this.numeroCartao = numeroCartao;
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
