package br.com.fatecesiii.core.implementacao.negocio;

import java.sql.Date;

import br.com.fatecesiii.core.IStrategy;
import br.com.fatecesiii.dominio.cliente.Cliente;
import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public class ValidarDadosObrigatorios implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		
		if(entidade instanceof Cliente) {
			
			Cliente cliente = (Cliente)entidade;
			
			String nome = cliente.getNome();
			Date dataNascimento = (Date)cliente.getDataNascimento();
			String cpf = cliente.getCpf();
			int ddd = cliente.getTelefones().get(0).getDdd();
			String numeroTelefone = cliente.getTelefones().get(0).getNumeroTelefone();
			String usuario = cliente.getUsuario().getUsuario();
			String senha = cliente.getUsuario().getSenha();
			
			if(nome == null || dataNascimento == null || cpf == null || ddd <= 0 || numeroTelefone == null || usuario == null || senha == null) {
				return "Dados são obrigatórios.";
			}
			
			if(nome.trim().equals("") || cpf.trim().equals("") || numeroTelefone.trim().equals("") || usuario.trim().equals("") || senha.trim().equals("")) {
				return "Dados são obrigatórios.";
			}
			
		}		
		
		return null;
	}

}
