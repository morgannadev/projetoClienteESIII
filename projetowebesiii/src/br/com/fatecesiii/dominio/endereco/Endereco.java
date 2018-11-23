package br.com.fatecesiii.dominio.endereco;

import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public class Endereco extends EntidadeDominio {
	
	private String nomeIdentificacaoEndereco; 
	private TipoResidencia tipoResidencia;
	private TipoLogradouro tipoLogradouro;
	private String logradouro;
	private int numero;
	private String cep;
	private Bairro bairro;
	private String observacoes; // único campo opcional, os demais são obrigatórios
	
	public String getNomeIdentificacaoEndereco() {
		return nomeIdentificacaoEndereco;
	}
	
	public void setNomeIdentificacaoEndereco(String nomeIdentificacaoEndereco) {
		this.nomeIdentificacaoEndereco = nomeIdentificacaoEndereco;
	}
	
	public TipoResidencia getTipoResidencia() {
		return tipoResidencia;
	}
	
	public void setTipoResidencia(TipoResidencia tipoResidencia) {
		this.tipoResidencia = tipoResidencia;
	}
	
	public TipoLogradouro getTipoLogradouro() {
		return tipoLogradouro;
	}
	
	public void setTipoLogradouro(TipoLogradouro tipoLogradouro) {
		this.tipoLogradouro = tipoLogradouro;
	}
	
	public String getLogradouro() {
		return logradouro;
	}
	
	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}
	
	public int getNumero() {
		return numero;
	}
	
	public void setNumero(int numero) {
		this.numero = numero;
	}
	
	public String getCep() {
		return cep;
	}
	
	public void setCep(String cep) {
		this.cep = cep;
	}
	
	public Bairro getBairro() {
		return bairro;
	}
	
	public void setBairro(Bairro bairro) {
		this.bairro = bairro;
	}
	
	public String getObservacoes() {
		return observacoes;
	}
	
	public void setObservacoes(String observacoes) {
		this.observacoes = observacoes;
	}	
}
