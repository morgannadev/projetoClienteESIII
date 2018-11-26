package br.com.fatecesiii.controle.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.fatecesiii.controle.web.command.ICommand;
import br.com.fatecesiii.controle.web.command.implementacao.AlterarCommand;
import br.com.fatecesiii.controle.web.command.implementacao.ConsultarCommand;
import br.com.fatecesiii.controle.web.command.implementacao.ExcluirCommand;
import br.com.fatecesiii.controle.web.command.implementacao.SalvarCommand;
import br.com.fatecesiii.controle.web.command.implementacao.VisualizarCommand;
import br.com.fatecesiii.controle.web.vh.IViewHelper;
import br.com.fatecesiii.controle.web.vh.implementacao.ClienteViewHelper;
import br.com.fatecesiii.core.aplicacao.Resultado;
import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private static Map<String, ICommand> commands;
	private static Map<String, IViewHelper> vhs;
       
    public Servlet() {

    	commands = new HashMap<String, ICommand>();
    	commands.put("SALVAR", new SalvarCommand());
    	commands.put("EXCLUIR", new ExcluirCommand());
    	commands.put("CONSULTAR", new ConsultarCommand());
    	commands.put("VISUALIZAR", new VisualizarCommand());
    	commands.put("ALTERAR", new AlterarCommand());
    	
    	vhs = new HashMap<String, IViewHelper>();
    	vhs.put("/projetowebesiii/SalvarCliente", new ClienteViewHelper());
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcessRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcessRequest(request, response);
	}
	
	protected void doProcessRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String uri = request.getRequestURI();
		String operacao = request.getParameter("operacao");
		IViewHelper vh = vhs.get(uri);
		EntidadeDominio entidade =  vh.getEntidade(request);
		ICommand command = commands.get(operacao);
		
		Resultado resultado = command.execute(entidade);
		vh.setView(resultado, request, response);
	}
}
