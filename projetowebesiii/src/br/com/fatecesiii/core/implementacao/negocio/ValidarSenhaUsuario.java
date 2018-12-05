package br.com.fatecesiii.core.implementacao.negocio;

import java.sql.Date;

import br.com.fatecesiii.core.IStrategy;
import br.com.fatecesiii.dominio.cliente.Cliente;
import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public class ValidarSenhaUsuario implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {

		if(entidade instanceof Cliente) {
			
			Cliente cliente = (Cliente)entidade;
			
			String senha = cliente.getUsuario().getSenha();
			
			if(senha.length() < 8) {
				return "Senha deve ser composta de pelo menos 8 caracteres.";
			}
		}		
		
		return null;
	}
}
