package br.com.fatecesiii.web.command.implementacao;

import br.com.fatecesiii.controle.web.command.ICommand;
import br.com.fatecesiii.core.IFachada;
import br.com.fatecesiii.core.implementacao.controle.Fachada;

public abstract class AbstractCommand implements ICommand {

	protected IFachada fachada = new Fachada();
}
