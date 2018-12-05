<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="br.com.fatecesiii.dominio.cliente.Cliente"%>
<%@page import="br.com.fatecesiii.dominio.cliente.Usuario"%>
<%@page import="br.com.fatecesiii.core.aplicacao.Resultado" %>
<%@page import="br.com.fatecesiii.core.util.ConvertDate"%>
<%@page import="br.com.fatecesiii.dominio.entidadedominio.EntidadeDominio" %>
<%@page import="java.util.List" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="/projetowebesiii/css/cliente.css" />
<title>Cadastro de Clientes</title>
</head>
<body>

	<%
		Cliente cliente = (Cliente) request.getAttribute("cliente");
		Usuario usuario = (Usuario) request.getAttribute("usuario");
		Resultado resultado = (Resultado) session.getAttribute("resultado");
	%>

	<nav class="navbar navbar-light bg-light">
	  <span class="navbar-brand mb-0 h1">Cadastro de Clientes</span>
	</nav>

	<div class="conteiner-cliente">
		<form action="Servlet" method="post">
			<label for="txtId">Id:</label>
			<%
				out.print("<input type='text' id='txtId' name='txtId' value=");
				if(cliente != null)
					out.print("'"+ cliente.getId() +"' readonly />"); 
				else
					out.print(" >"); 		
			%>
			
			<label for="txtNome">Nome:</label>
			<%
				out.print("<input type='text' id='txtNome' name='txtNome' placeholder='Nome' value=");
				if(cliente != null)
					out.print("'"+ cliente.getNome() +" />"); 
				else
					out.print(" >"); 		
			%>
			
			<label for="txtCpf">CPF:</label>
			<%
				out.print("<input type='text' id='txtCpf' name='txtCpf' placeholder='CPF' value=");
				if(cliente != null)
					out.print("'"+ cliente.getCpf() +" />"); 
				else
					out.print(" >"); 		
			%>
					
			<label for="dateDataNascimento">Data de nascimento:</label>
			<%		
				if(cliente != null) {
					String dataNascimento = ConvertDate.converteDateString(cliente.getDataNascimento());
					out.print("<input type='date' id='dtDataNascimento' name='dtDataNascimento' placeholder='Data Nascimento' value='" + dataNascimento + "' readonly />");
				} else {
					
				}
			%>
			
			<% 
			//<label for="txtGenero">Gênero:</label>
			//<select>
			//  <option value="feminino">Feminino</option>
			//  <option value="masculino">Masculino</option>
			//  <option value="outros">Outros</option>
			//</select>
			%>
			
			<label for="txtTelefone">Telefone:</label>
			<br>
			<label for="txtDDD">DDD:</label>
			<%
				out.print("<input type='text' id='txtDDD' name='txtDDD' placeholder='DDD' value=");
				if(cliente != null)
					out.print("'"+ cliente.getTelefones().get(0).getDdd() +" />"); 
				else
					out.print(" >"); 		
			%>
			
			<label for="txtTelefone">Número telefone:</label>
			<%
				out.print("<input type='text' id='txtNumeroTelefone' name='txtNumeroTelefone' placeholder='Número do telefone' value=");
				if(cliente != null)
					out.print("'"+ cliente.getTelefones().get(0).getNumeroTelefone() +" />"); 
				else
					out.print(" >"); 		
			%>
			
			<label for="txtEmail">E-mail:</label>
			<%
				out.print("<input type='text' id='txtEmail' name='txtEmail' placeholder='E-mail' value=");
				if(cliente != null)
					out.print("'"+ cliente.getEmail() +" />"); 
				else
					out.print(" >"); 		
			%>	
			
			<label for="txtUsuario">Usuário:</label>
			<%
				out.print("<input type='text' id='txtUsuario' name='txtUsuario' placeholder='Usuário' value=");
				if(cliente != null && usuario != null)
					out.print("'"+ cliente.getUsuario().getUsuario() +" />"); 
				else
					out.print(" >"); 		
			%>	
			
			<label for="txtSenha">Senha:</label>
			<%
				out.print("<input type='password' id='txtSenha' name='txtSenha' placeholder='Senha' value=");
				if(cliente != null && usuario != null)
					out.print("'"+ cliente.getUsuario().getSenha() +" />"); 
				else
					out.print(" >"); 		
			%>		
			
			<label for="txtSenha">Confirmar senha:</label>
			<%
				out.print("<input type='password' id='txtConfirmarSenha' name='txtConfirmarSenha' placeholder='Senha' value=");
				if(cliente != null && usuario != null)
					out.print("'"+ cliente.getUsuario().getSenha() +" />"); 
				else
					out.print(" >"); 		
			%>
			
			<%		
				if(cliente != null) {
					String dataCadastro = ConvertDate.converteDateString(cliente.getDataCadastro());
					out.print("<label for='txtDtCadastro'>Data de Cadastro:</label>");
					out.print("<input type='text' id='txtDtCadastro' name='txtDtCadastro' value='" + dataCadastro + "' readonly />");
				} 
			%>
			
			<input class="btn btn-outline-primary" type="submit" id="operacao" name="operacao" value="SALVAR_CLIENTE" />			
		</form>
	</div>
	
	<div>
	
		<table class="table table-hover">
		  <thead>
		    <tr>
		      <th scope="col">Nome</th>
		      <th scope="col">CPF</th>
		      <th scope="col">Telefone</th>
		      <th scope="col">E-mail</th>
		      
		    </tr>
		  </thead>
		  <tbody>
		    <%
			    /*if(resultado != null) {
			    	List<EntidadeDominio> entidades = resultado.getEntidades();
			    	if(entidades != null) {
			    		for(int i = 0; i < entidades.size(); i++) {
			    			out.print("<tr>");
					   		out.print("<td>" + cliente.getNome() + "</td>");
					   		out.print("<td>" + cliente.getCpf() + "</td>");
					   		out.print("<td>(" + cliente.getTelefones().get(i).getDdd() + ") " + cliente.getTelefones().get(i).getNumeroTelefone() + "</td>");
					   		out.print("<td>" + cliente.getEmail() + "</td>");
					   		//out.print("<td></td>");
						    out.print("</tr>");
			    		}			    		
			    	}
			    }*/
		    %>
		      <tr>
		      	<td>
		      	<%
		      		cliente.getNome();
		      	%>
				</td>
		      	<td>2</td>
		      	<td>3</td>
		      	<td>4</td>
			  </tr>
		      
		  </tbody>
		</table>
		
	</div>

</body>
</html>