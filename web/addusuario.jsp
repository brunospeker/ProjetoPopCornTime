<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adicionar Usuario</title><!-- Titulo da pagina -->
        <link rel="stylesheet" type="text/css" href="css/mainstyle.css"><!-- Chamando o css mainstyle -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!-- Chamando a biblioteca online ajax para utilizar ela no logindrop.js -->
        <script type="text/javascript" src="js/logindrop.js"></script>
    </head>
    <body style="margin: 0 auto; width: 1200px;">
        
        <%@include file="include/header.jsp" %><!-- Inclusão do cabeçalho -->
        
        <div class="content"><!-- Div usada para o conteudo -->
            <div class="CRU">
                <form action="ControleUsuario" method="POST">
                    <!-- Alguns input com disable, pois são criados automaticamente pelo BD -->
                    <fieldset>
                        <label>ID:</label>
                        <input disabled="disabled" name="id" value="">
                    </fieldset>
                    <fieldset>
                        <label>Usuario:</label>
                        <input type="text" name="usuario" value="">
                    </fieldset>
                    <fieldset>
                        <label>Nome:</label>
                        <input type="text" name="nome" value="">
                    </fieldset>
                    <fieldset>
                        <label>Email:</label>
                        <input type="email" name="email" value="">
                    </fieldset>
                    <fieldset>
                        <label>Senha:</label>
                        <input type="password" name="senha" value="">
                    </fieldset>
                    <fieldset>
                        <label>Pin:</label>
                        <input type="text" name="pin" value="">
                    </fieldset>
                    <fieldset>
                        <label>Foto de perfil:</label>
                        <input type="text" name="urlfoto" value="">
                    </fieldset>
                    <fieldset>
                        <label>Data de acesso:</label>
                        <input disabled="disabled" value="">
                    </fieldset>
                    <fieldset>
                        <label>Administrador:</label>
                        <input type="text" name="admin" value="">
                    </fieldset>
                    <button type="submit">Confirmar os campos e adicionar o usuario!</button>
                    <!-- Dispara o servlet ControleUsuario -->
                </form>
            </div>
        </div><!-- Fechando a div de conteudo -->
        <footer><!-- Rodapé, contem em quase todas as paginas e tem um link para voltar a pagina inicial -->
            <a href="index.jsp" style='color: white; text-decoration: none;'>Copyright © 2019 PopcornTime Grupo J. Todos os direitos reservados.</a>
        </footer>
    </body>
</html>