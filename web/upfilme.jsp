<%@page import="Modelo.Filme"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Filme</title><!-- Titulo da pagina -->
        <link rel="stylesheet" type="text/css" href="css/mainstyle.css"><!-- Chamando o css mainstyle -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!-- Chamando a biblioteca online ajax para utilizar ela no logindrop.js -->
        <script type="text/javascript" src="js/logindrop.js"></script>
    </head>
    <body style="margin: 0 auto; width: 1200px;">
        
        <%@include file="include/header.jsp" %><!-- Inclusão do cabeçalho -->
        
        <div class="content"><!-- Div usada para o conteudo -->
            <div class="CRU">
                <!-- Pegando o atributo passado pela servlet ControleFilme e populando os campos -->
                <%
                    Filme fil = (Filme)request.getAttribute("fil");
                %>
                <form action="ControleFilme" method="POST">
                    <fieldset>
                        <label>ID:</label>
                        <input disabled="disabled" value="<%=fil.getIdfilme()%>">
                        <input type="hidden" name="idfilme" value="<%=fil.getIdfilme()%>">
                        <!-- Tatica usada com o hidden, pois o servlet POST não reconhece input disabled -->
                    </fieldset>
                    <fieldset>
                        <label>Nome do Filme:</label>
                        <input type="text" name="nomefilme" value="<%=fil.getNomefilme()%>">
                    </fieldset>
                    <fieldset>
                        <label>Data de Lançamento:</label>
                        <input type="text" name="lancamento" value="<%=fil.getLancamento()%>">
                    </fieldset>
                    <fieldset>
                        <label>Direção:</label>
                        <input type="text" name="direcao" value="<%=fil.getDirecao()%>">
                    </fieldset>
                    <fieldset>
                        <label>Nacionalidade:</label>
                        <input type="text" name="pais" value="<%=fil.getPais()%>">
                    </fieldset>
                    <fieldset>
                        <label>Foto do cartaz:</label>
                        <input type="text" name="urlcartaz" value="<%=fil.getUrlcartaz()%>">
                    </fieldset>
                    <fieldset>
                        <label>Quantidade de votos:</label>
                        <input disabled="disabled" name="votosfilme" value="<%=fil.getVotosfilme()%>">
                    </fieldset>
                    <fieldset>
                        <label>Quantidade de votantes:</label>
                        <input disabled="disabled" name="votantesfilme" value="<%=fil.getVotantesfilme()%>">
                    </fieldset>
                    <fieldset>
                        <label>Media de votos:</label>
                        <input disabled="disabled" name="mediafilme" value="<%=fil.getMediafilme()%>">
                    </fieldset>
                    <button type="submit">Confirmar os campos e editar o filme!</button>
                    <!-- Dispara a servlet ControleFilme -->
                </form>
            </div>
        </div><!-- Fechando a div de conteudo -->
        <footer><!-- Rodapé, contem em quase todas as paginas e tem um link para voltar a pagina inicial -->
            <a href="index.jsp" style='color: white; text-decoration: none;'>Copyright © 2019 PopcornTime Grupo J. Todos os direitos reservados.</a>
        </footer>
    </body>
</html>