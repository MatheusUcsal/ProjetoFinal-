<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>

<%
    String nome = request.getParameter("nome");
    String autor = request.getParameter("autor");
    int nota = Integer.parseInt(request.getParameter("nota"));

    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        Class.forName("org.hsqldb.jdbc.JDBCDriver");

        connection = DriverManager.getConnection("jdbc:hsqldb:hsql://localhost/banco", "SA", "");

        String sql = "INSERT INTO Livros (nome, autor, nota) VALUES (?, ?, ?)";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, nome);
        preparedStatement.setString(2, autor);
        preparedStatement.setInt(3, nota);

        preparedStatement.executeUpdate();

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (preparedStatement != null) {
            preparedStatement.close();
        }
        if (connection != null) {
            connection.close();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Livro Adicionado</title>
</head>
<body>
    <h2>Livro Adicionado com Sucesso!</h2>
    <p><a href="index.html">Voltar para o Cadastro</a></p>
</body>
</html>
