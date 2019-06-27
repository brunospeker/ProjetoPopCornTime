<%@page import="Modelo.Usuario"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Usuario</title><!-- Titulo da pagina -->
        <link rel="stylesheet" type="text/css" href="css/mainstyle.css"><!-- Chamando o css mainstyle -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!-- Chamando a biblioteca online ajax para utilizar ela no logindrop.js -->
        <script type="text/javascript" src="js/logindrop.js"></script>
    </head>
    <body style="margin: 0 auto; width: 1200px;">
        
        <%@include file="include/header.jsp" %><!-- Inclusão do cabeçalho -->
        
        <div class="content"><!-- Div usada para o conteudo -->
            <div class="CRU">
                <!-- Pegando o atributo passado pela servlet ControleUsuario e populando os campos -->
                <%
                    Usuario usu = (Usuario)request.getAttribute("usu");
                %>
                <form action="ControleUsuario" method="POST">
                    <fieldset>
                        <label>ID:</label>
                        <input disabled="disabled" value="<%=usu.getId()%>">
                        <input type="hidden" name="id" value="<%=usu.getId()%>">
                        <!-- Tatica usada com o hidden, pois o servlet POST não reconhece input disabled -->
                    </fieldset>
                    <fieldset>
                        <label>Usuario:</label>
                        <input type="text" name="usuario" value="<%=usu.getUsuario()%>">
                    </fieldset>
                    <fieldset>
                        <label>Nome:</label>
                        <input type="text" name="nome" value="<%=usu.getNome()%>">
                    </fieldset>
                    <fieldset>
                        <label>Email:</label>
                        <input type="email" name="email" value="<%=usu.getEmail()%>">
                    </fieldset>
                    <fieldset>
                        <label>Senha:</label>
                        <input type="text" name="senha" value="<%=usu.getSenha()%>">
                    </fieldset>
                    <fieldset>
                        <label>Pin:</label>
                        <input type="text" name="pin" value="<%=usu.getPin()%>">
                    </fieldset>
                    <fieldset>
                        <label>Foto de perfil:</label>
                        <input type="text" name="urlfoto" value="<%=usu.getUrlfoto()%>">
                    </fieldset>
                    <fieldset>
                        <label>Data de acesso:</label>
                        <input disabled="disabled" value="<%=usu.getAcesso()%>">
                    </fieldset>
                    <fieldset>
                        <label>Administrador:</label>
                        <input type="text" name="admin" value="<%=usu.getAdmin()%>">
                    </fieldset>
                    <button type="submit">Confirmar os campos e atualizar o usuario!</button>
                    <!-- Dispara a servlet ControleUsuario -->
                </form>
            </div>
        </div><!-- Fechando a div de conteudo -->
        <footer><!-- Rodapé, contem em quase todas as paginas e tem um link para voltar a pagina inicial -->
            <a href="index.jsp" style='color: white; text-decoration: none;'>Copyright © 2019 PopcornTime Grupo J. Todos os direitos reservados.</a>
        </footer>
    </body>
</html>
