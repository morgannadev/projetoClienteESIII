package br.com.fatecesiii.web.command.implementacao;

import br.com.fatecesiii.controle.implementacao.controle.Fachada;
import br.com.fatecesiii.controle.web.command.ICommand;
import br.com.fatecesiii.core.IFachada;

public abstract class AbstractCommand implements ICommand {

	protected IFachada fachada = new Fachada();
}
