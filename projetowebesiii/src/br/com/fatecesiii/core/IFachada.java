package br.com.fatecesiii.core;

import br.com.fatecesiii.core.aplicacao.Resultado;
import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public interface IFachada {

	public Resultado salvar(EntidadeDominio entidade);
	public Resultado alterar(EntidadeDominio entidade);
	public Resultado excluir(EntidadeDominio entidade);
	public Resultado consultar(EntidadeDominio entidade);
	public Resultado visualizar(EntidadeDominio entidade);
}
