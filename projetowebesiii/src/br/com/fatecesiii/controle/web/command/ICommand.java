package br.com.fatecesiii.controle.web.command;

import br.com.fatecesiii.core.aplicacao.Resultado;
import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public interface ICommand {

	public Resultado execute(EntidadeDominio entidade);
}
