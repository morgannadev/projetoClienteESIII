package br.com.fatecesiii.core.implementacao.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import br.com.fatecesiii.dominio.cliente.Cliente;
import br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio;

public class ClienteDAO extends AbstractDAO {

	public ClienteDAO() {
		
		super("tb_cliente", "id_cliente");		
	}
	
	@Override
	public void salvar(EntidadeDominio entidade) throws SQLException {

		openConnection();
		PreparedStatement prepStatement = null;
		Cliente cliente = (Cliente)entidade;
				
		try {
			
			connection.setAutoCommit(false);			
					
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO TB_CLIENTE(nome, cpf, data_nascimento, email, id_genero, id_endereco, id_ranking, id_transacao, id_usuario, id_status_cliente, id_cartao, id_telefone, data_cadastro");
			sql.append("VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)");		
					
			prepStatement = connection.prepareStatement(sql.toString());
			
			prepStatement.setString(1, cliente.getNome());
			prepStatement.setString(2, cliente.getCpf());
			Timestamp dataNascimento = new Timestamp(cliente.getDataNascimento().getTime());
			prepStatement.setTimestamp(3, dataNascimento);
			prepStatement.setString(4, cliente.getEmail());
			prepStatement.setInt(5, cliente.getGenero().getId());
			prepStatement.setInt(6, cliente.getEnderecosResidencial().get(0).getId());
			prepStatement.setInt(7, cliente.getRankings().get(0).getId());
			prepStatement.setInt(8, cliente.getTransacoes().get(0).getId());
			prepStatement.setInt(9, cliente.getUsuario().getId());
			prepStatement.setInt(10, cliente.getStatus().getId());
			prepStatement.setInt(11, cliente.getCartoesCredito().get(0).getId());
			prepStatement.setInt(12, cliente.getTelefones().get(0).getId());
			Timestamp dataCadastro = new Timestamp(cliente.getDataCadastro().getTime());
			prepStatement.setTimestamp(13, dataCadastro);
			
			prepStatement.executeUpdate();			
			
			ResultSet resultSet = prepStatement.getGeneratedKeys();
			int id = 0;
			if(resultSet.next())
				id = resultSet.getInt(1);
			cliente.setId(id);
			
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
				prepStatement.close();
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
		
		PreparedStatement prepStatement = null;
		
		Cliente cliente = (Cliente)entidade;
		String sql = null;
		
		
		
		if(cliente.getId() <= 0 && cliente.getNome().equals("")) {
			sql = "SELECT * FROM TB_CLIENTE";
		} else if(cliente.getId() <= 0 && !cliente.getNome().equals("")) {
			sql = "SELECT * FROM TB_CLIENTE WHERE id_cliente like ?";
		}	
	
		/*try {
			
			openConnection();
			prepStatement = connection.prepareStatement(sql);
			
			if(produto.getId() != null && produto.getDescricao().equals("")){
				prepStatement.setInt(1, produto.getId());
			} else if(produto.getId() == null && !produto.getDescricao().equals("")){
				prepStatement.setString(1, "%"+produto.getDescricao()+"%");			
			}
			
	
			
			ResultSet rs = pst.executeQuery();
			List<EntidadeDominio> produtos = new ArrayList<EntidadeDominio>();
			while (rs.next()) {
				Produto p = new Produto();
				p.setId(rs.getInt("id_pro"));
				p.setDescricao(rs.getString("descricao"));
				p.setQuantidade(rs.getInt("quantidade"));
				
				java.sql.Date dtCadastroEmLong = rs.getDate("dt_cadastro");
				Date dtCadastro = new Date(dtCadastroEmLong.getTime());				
				p.setDtCadastro(dtCadastro);
				produtos.add(p);
			}
			return produtos;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		*/
		return null;
	}
}
