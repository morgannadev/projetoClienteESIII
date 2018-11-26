package br.com.fatecesiii.web.command.implementacao;

import br.com.fatecesiii.core.aplicacao.Resultado;
import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public class ConsultarCommand extends AbstractCommand {

	public Resultado execute(EntidadeDominio entidade) {
		
		return fachada.consultar(entidade);
	}
}
