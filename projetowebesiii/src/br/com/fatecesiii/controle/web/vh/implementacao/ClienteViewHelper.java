package br.com.fatecesiii.controle.web.vh.implementacao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.fatecesiii.controle.web.vh.IViewHelper;
import br.com.fatecesiii.core.aplicacao.Resultado;
import br.com.fatecesiii.dominio.cliente.Cliente;
import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public class ClienteViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio getEntidade(HttpServletRequest request) {
		
		// TODO: ajustar para fazer o request em todos os dados
		
		String nome = request.getParameter("txtNome");
		String cpf = request.getParameter("txtCpf");
		String id = request.getParameter("txtId");		
		
		Cliente cliente = new Cliente();
		cliente.setNome(nome);
		
		if(id != null && !id.trim().equals("")){
			cliente.setId(Integer.parseInt(id));
		}
		
		cliente.setCpf(cpf);
		
		return cliente;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
	}	
}
