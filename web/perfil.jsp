<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Pegando o atributo passado pelo servlet PopUsuario e populando os campos no decorrer da pagina -->
<%
    Usuario user = (Usuario)request.getAttribute("User");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=user.getUsuario()%></title><!-- Titulo da pagina -->
        <link rel="stylesheet" type="text/css" href="css/mainstyle.css"><!-- Chamando o css mainstyle -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!-- Chamando a biblioteca online ajax para utilizar ela no logindrop.js -->
        <script type="text/javascript" src="js/logindrop.js"></script>
    </head>
    <body style="margin: 0 auto; width: 1200px;">
        
        <%@include file="include/header.jsp" %><!-- Inclusão do cabeçalho -->
        
        <div class="content"><!-- Div usada para o conteudo -->
            <div class="perfil"><!-- Começo dos dados populados do usuario -->
                <div class="infperfil">
                    <img src="<%=user.getUrlfoto()%>" width="150px" height="200px">
                    <h1><%=user.getUsuario()%></h1>
                    <h2>Nome: <%=user.getNome()%></h2>
                    <h2>Email: <%=user.getEmail()%></h2>
                    <h2>Data de Criação do Perfil: <%=user.getAcesso()%></h2>
                    <h3>Seu ID: <%=user.getId()%></h3>
                </div>
            </div>
        </div><!-- Fechando a div de conteudo -->
        <footer><!-- Rodapé, contem em quase todas as paginas e tem um link para voltar a pagina inicial -->
            <a href="index.jsp" style='color: white; text-decoration: none;'>Copyright © 2019 PopcornTime Grupo J. Todos os direitos reservados.</a>
        </footer>
    </body>
</html>
