package br.com.fatecesiii.core.implementacao.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import br.com.fatecesiii.dominio.cliente.Cliente;
import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public class ClienteDAO extends AbstractDAO {

	public ClienteDAO() {
		
		super("TB_CLIENTE", "ID_CLIENTE");		
	}
	
	@Override
	public void salvar(EntidadeDominio entidade) throws SQLException {

		openConnection();
		PreparedStatement pst = null;
		Cliente cliente = (Cliente)entidade;
				
		try {
			
			connection.setAutoCommit(false);			
					
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO TB_CLIENTE(NOME, CPF, ");
			sql.append("dt_cadastro) VALUES (?,?,?)");		
					
			pst = connection.prepareStatement(sql.toString());
			pst.setString(1, cliente.getNome());
			pst.setString(2, cliente.getCpf());
			Timestamp time = new Timestamp(cliente.getDataCadastro().getTime());
			pst.setTimestamp(3, time);
			pst.executeUpdate();			
			connection.commit();		
		} catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();			
		} finally {
			try {
				pst.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
	}

	@Override
	public void alterar(EntidadeDominio entidade) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
}
