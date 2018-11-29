package br.com.fatecesiii.core.implementacao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import br.com.fatecesiii.dominio.endereco.Endereco;
import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public class EnderecoDAO extends AbstractDAO {

	protected EnderecoDAO(String table, String idTable) {
		super("tb_endereco", "id_end");	
	}
	
	public EnderecoDAO(Connection cx){
		super(cx, "tb_endereco", "id_end");
	}
	
	public EnderecoDAO(){
		super("tb_endereco", "id_end");			
	}
	
	@Override
	public void salvar(EntidadeDominio entidade) throws SQLException {

		if(connection == null){
			openConnection();
		}
		
		PreparedStatement pst=null;
		Endereco end = (Endereco)entidade;
		StringBuilder sql = new StringBuilder();
		
		sql.append("INSERT INTO tb_endereco(cidade, estado, ");
		sql.append("logradouro, numero, cep) ");
		sql.append(" VALUES (?, ?, ?, ?, ?)");	
		try {
			connection.setAutoCommit(false);
			
					
			pst = connection.prepareStatement(sql.toString(), 
					Statement.RETURN_GENERATED_KEYS);
			
			//pst.setString(1, end.getCidade().getNome());
			//pst.setString(2, end.getCidade().getEstado().getNome());
			pst.setString(3, end.getLogradouro());
			//pst.setString(4, end.getNumero());
			pst.setString(5, end.getCep());			
			pst.executeUpdate();		
					
			ResultSet rs = pst.getGeneratedKeys();
			int idEnd=0;
			if(rs.next())
				idEnd = rs.getInt(1);
			end.setId(idEnd);
			
			connection.commit();					
		} catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();	
		}finally{
			if(ctrlTransaction){
				try {
					pst.close();
					if(ctrlTransaction)
						connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
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
