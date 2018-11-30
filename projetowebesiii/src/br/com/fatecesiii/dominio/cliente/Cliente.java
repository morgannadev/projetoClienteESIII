package br.com.fatecesiii.dominio.cliente;

import java.util.Date;
import java.util.List;

import br.com.fatecesiii.dominio.endereco.EnderecoCobranca;
import br.com.fatecesiii.dominio.endereco.EnderecoEntrega;
import br.com.fatecesiii.dominio.endereco.EnderecoResidencial;
import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public class Cliente extends EntidadeDominio {
	
	private boolean isAtivo;
	private Genero genero;
	private String nome;
	private String cpf;
	private Date dataNascimento;
	private List<Telefone> telefones;
	private String email;
	private List<EnderecoCobranca> enderecosCobranca;
	private List<EnderecoEntrega> enderecosEntrega;
	private List<EnderecoResidencial> enderecosResidencial;
	private List<Ranking> rankings;
	private List<Transacao> transacoes;
	private Usuario usuario;
	
	public boolean isAtivo() {
		return isAtivo;
	}
	
	public void setAtivo(boolean isAtivo) {
		this.isAtivo = isAtivo;
	}
	
	public Genero getGenero() {
		return genero;
	}
	
	public void setGenero(Genero genero) {
		this.genero = genero;
	}
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getCpf() {
		return cpf;
	}
	
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	
	public Date getDataNascimento() {
		return dataNascimento;
	}
	
	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}
	
	public List<Telefone> getTelefones() {
		return telefones;
	}
	
	public void setTelefones(List<Telefone> telefones) {
		this.telefones = telefones;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public List<EnderecoCobranca> getEnderecosCobranca() {
		return enderecosCobranca;
	}
	
	public void setEnderecosCobranca(List<EnderecoCobranca> enderecosCobranca) {
		this.enderecosCobranca = enderecosCobranca;
	}
	
	public List<EnderecoEntrega> getEnderecosEntrega() {
		return enderecosEntrega;
	}
	public void setEnderecosEntrega(List<EnderecoEntrega> enderecosEntrega) {
		this.enderecosEntrega = enderecosEntrega;
	}
	public List<EnderecoResidencial> getEnderecosResidencial() {
		return enderecosResidencial;
	}
	public void setEnderecosResidencial(List<EnderecoResidencial> enderecosResidencial) {
		this.enderecosResidencial = enderecosResidencial;
	}
	public List<Ranking> getRankings() {
		return rankings;
	}
	public void setRankings(List<Ranking> rankings) {
		this.rankings = rankings;
	}
	public List<Transacao> getTransacoes() {
		return transacoes;
	}
	public void setTransacoes(List<Transacao> transacoes) {
		this.transacoes = transacoes;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
}
