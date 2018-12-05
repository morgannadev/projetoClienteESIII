package br.com.fatecesiii.core.implementacao.controle;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import br.com.fatecesiii.core.IDAO;
import br.com.fatecesiii.core.IFachada;
import br.com.fatecesiii.core.IStrategy;
import br.com.fatecesiii.core.aplicacao.Resultado;
import br.com.fatecesiii.core.implementacao.dao.ClienteDAO;
import br.com.fatecesiii.core.implementacao.negocio.ComplementarDataCadastro;
import br.com.fatecesiii.core.implementacao.negocio.ValidarDadosObrigatorios;
import br.com.fatecesiii.core.implementacao.negocio.ValidarSenhaUsuario;
import br.com.fatecesiii.dominio.cliente.Cliente;
import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public class Fachada implements IFachada {

	private Map<String, IDAO> daos;
	private Map<String, Map<String, List<IStrategy>>> rns;	
	private Resultado resultado;
	
	public Fachada() {
		
		daos = new HashMap<String, IDAO>();
		rns = new HashMap<String, Map<String, List<IStrategy>>>();
		
		ClienteDAO clienteDAO = new ClienteDAO();
		
		daos.put(Cliente.class.getName(), clienteDAO);
		
		ComplementarDataCadastro compDataCadastro = new ComplementarDataCadastro();
		ValidarDadosObrigatorios valDadosObrigatorios = new ValidarDadosObrigatorios();
		ValidarSenhaUsuario valSenhaUsuario = new ValidarSenhaUsuario();
				
		List<IStrategy> rnsSalvarCliente = new ArrayList<IStrategy>();
		rnsSalvarCliente.add(compDataCadastro);	
		rnsSalvarCliente.add(valDadosObrigatorios);	
		rnsSalvarCliente.add(valSenhaUsuario);	
		
		Map<String, List<IStrategy>> rnsCliente = new HashMap<String, List<IStrategy>>();
		rnsCliente.put("SALVAR", rnsSalvarCliente);	
		rns.put(Cliente.class.getName(), rnsCliente);
	}
	
	@Override
	public Resultado salvar(EntidadeDominio entidade) {
		
		resultado = new Resultado();
		String nmClasse = entidade.getClass().getName();	
		
		String msg = executarRegras(entidade, "SALVAR");
		
		
		if(msg == null) {
			
			IDAO dao = daos.get(nmClasse);
			
			try {
				dao.salvar(entidade);
				List<EntidadeDominio> entidades = new ArrayList<EntidadeDominio>();
				entidades.add(entidade);
				resultado.setEntidades(entidades);
			} catch (SQLException e) {
				e.printStackTrace();
				resultado.setMensagem("Não foi possível realizar o registro!");				
			}
		} else {
			resultado.setMensagem(msg);
		}
		
		return resultado;
	}
	
	private String executarRegras(EntidadeDominio entidade, String operacao) {
		
		String nmClasse = entidade.getClass().getName();		
		StringBuilder msg = new StringBuilder();
		
		Map<String, List<IStrategy>> regrasOperacao = rns.get(nmClasse);
		
		if(regrasOperacao != null) {
			
			List<IStrategy> regras = regrasOperacao.get(operacao);
			
			if(regras != null) {
				
				for(IStrategy s: regras) {		
					
					String m = s.processar(entidade);			
					
					if(m != null) {
						
						msg.append(m);
						msg.append("\n");
					}			
				}	
			}		
		}
		
		if(msg.length() > 0)
			return msg.toString();
		else
			return null;
	}

	@Override
	public Resultado alterar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Resultado excluir(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Resultado consultar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Resultado visualizar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		return null;
	}
}
