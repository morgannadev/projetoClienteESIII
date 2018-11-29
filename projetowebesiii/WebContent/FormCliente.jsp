<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>CADASTRO DE CLIENTES</title>
</head>
<body>

	<div>
		<form action="Servlet" method="post">
			<label for="txtId">Id:</label>
			<input type="text" id="txtId" name="txtId"/>
			</br> 
			
			<label for="txtNome">Nome:</label>
			<input type="text" id="txtNome" name="txtNome"/>
			</br> 
			
			<label for="txtCpf">CPF:</label>
			<input type="text" id="txtCpf" name="txtCpf"/>
			</br>
						
			<label for="dateDataNascimento">Data de nascimento:</label>
			<input type="date" id="dateDataNascimento" name="dateDataNascimento"/>
			</br>
			
			<label for="txtTelefone">Telefone:</label>
			<input type="text" id="txtTelefone" name="txtTelefone"/>
			</br>
			
			<label for="txtEmail">E-mail:</label>
			<input type="text" id="txtEmail" name="txtEmail"/>
			</br>
			
			<input type="submit" id="operacao" name="operacao" value="SALVAR_CLIENTE"/>
			<input type="submit" id="operacao" name="operacao" value="EXCLUIR_CLIENTE"/>	
		</form>
	</div>

</body>
</html>