package br.com.fatecesiii.controle.web.command.implementacao;

import br.com.fatecesiii.core.aplicacao.Resultado;
import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public class AlterarCommand extends AbstractCommand {

	public Resultado execute(EntidadeDominio entidade) {
		
		return fachada.alterar(entidade);
	}
}
