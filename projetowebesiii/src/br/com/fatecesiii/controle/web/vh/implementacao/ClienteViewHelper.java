package br.com.fatecesiii.controle.web.vh.implementacao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import br.com.fatecesiii.controle.web.vh.IViewHelper;
import br.com.fatecesiii.core.aplicacao.Resultado;
import br.com.fatecesiii.core.util.ConvertDate;
import br.com.fatecesiii.dominio.cliente.Cliente;
import br.com.fatecesiii.dominio.cliente.Usuario;
import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public class ClienteViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio getEntidade(HttpServletRequest request) {
				
		String id = request.getParameter("txtId");	
		String nome = request.getParameter("txtNome");
		String cpf = request.getParameter("txtCpf");
		String dataNascimento = request.getParameter("dtDataNascimento");
		//String telefone = request.getParameter("txtDDD") + request.getParameter("txtNumeroTelefone");
		//String nomeUsuario = request.getParameter("txtUsuario");
		//String senha = request.getParameter("txtSenha");
		
		Cliente cliente = new Cliente();
		//Usuario usuario = new Usuario();
		
		if(id != null && !id.trim().equals("")) {
			cliente.setId(Integer.parseInt(id));
		}
		
		cliente.setNome(nome);
		cliente.setCpf(cpf);
		cliente.setDataNascimento(ConvertDate.converteStringDate(dataNascimento));
		//cliente.setUsuario(usuario.setUsuario(nomeUsuario));
		//usuario.setUsuario(cliente.setUsuario(usuario));		
		
		return cliente;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		RequestDispatcher reqDispatcher = null;
		
		String operacao = request.getParameter("operacao");
		
		if(resultado.getMensagem() == null) {
			if(operacao.equals("SALVAR")){
				resultado.setMensagem("Cliente cadastrado com sucesso!");
			}
			
			request.getSession().setAttribute("resultado", resultado);
			reqDispatcher = request.getRequestDispatcher("FormCliente.jsp");  			
		}
		
		if(resultado.getMensagem() == null && operacao.equals("ALTERAR")) {
			
			reqDispatcher = request.getRequestDispatcher("FormCliente.jsp");  
		}
		
		if(resultado.getMensagem() == null && operacao.equals("VISUALIZAR")) {
			
			request.setAttribute("produto", resultado.getEntidades().get(0));
			reqDispatcher = request.getRequestDispatcher("FormCliente.jsp");  			
		}
		
		if(resultado.getMensagem() == null && operacao.equals("EXCLUIR")) {
			
			request.getSession().setAttribute("resultado", null);
			reqDispatcher = request.getRequestDispatcher("FormCliente.jsp");  
		}
		
		if(resultado.getMensagem() != null) {
			if(operacao.equals("SALVAR") || operacao.equals("ALTERAR")){
				request.getSession().setAttribute("resultado", resultado);
				reqDispatcher = request.getRequestDispatcher("FormCliente.jsp");  	
			}
		}
		
		reqDispatcher.forward(request, response); 
	}	
}
