<%@page import="Modelo.Ator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Ator/Atriz</title><!-- Titulo da pagina -->
        <link rel="stylesheet" type="text/css" href="css/mainstyle.css"><!-- Chamando o css mainstyle -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!-- Chamando a biblioteca online ajax para utilizar ela no logindrop.js -->
        <script type="text/javascript" src="js/logindrop.js"></script>
    </head>
    <body style="margin: 0 auto; width: 1200px;">
        
        <%@include file="include/header.jsp" %><!-- Inclusão do cabeçalho -->
        
        <div class="content"><!-- Div usada para o conteudo -->
            <div class="CRU">
                <!-- Pegando o atributo passado pela servlet ControleAtor e populando os campos -->
                <%
                    Ator ato = (Ator)request.getAttribute("ato");
                %>
                <form action="ControleAtor" method="POST">
                    <fieldset>
                        <label>ID:</label>
                        <input disabled="disabled" value="<%=ato.getIdator()%>">
                        <input type="hidden" name="idator" value="<%=ato.getIdator()%>">
                        <!-- Tatica usada com o hidden, pois o servlet POST não reconhece input disabled -->
                    </fieldset>
                    <fieldset>
                        <label>Nome do Ator/Atriz:</label>
                        <input type="text" name="nomeator" value="<%=ato.getNomeator()%>">
                    </fieldset>
                    <fieldset>
                        <label>Conjuge:</label>
                        <input type="text" name="conjuge" value="<%=ato.getConjuge()%>">
                    </fieldset>
                    <fieldset>
                        <label>Nacionalidade:</label>
                        <input type="text" name="nacionalidade" value="<%=ato.getNacionalidade()%>">
                    </fieldset>
                    <fieldset>
                        <label>Data de Nascimento:</label>
                        <input type="text" name="nascimento" value="<%=ato.getNascimento()%>">
                    </fieldset>
                    <fieldset>
                        <label>Foto do Ator/Atriz:</label>
                        <input type="text" name="urlretrato" value="<%=ato.getUrlretrato()%>">
                    </fieldset>
                    <fieldset>
                        <label>Quantidade de votos:</label>
                        <input disabled="disabled" name="votosator" value="<%=ato.getVotosator()%>">
                    </fieldset>
                    <fieldset>
                        <label>Quantidade de votantes:</label>
                        <input disabled="disabled" name="votantesator" value="<%=ato.getVotantesator()%>">
                    </fieldset>
                    <fieldset>
                        <label>Media de votos:</label>
                        <input disabled="disabled" name="mediaator" value="<%=ato.getMediaator()%>">
                    </fieldset>
                    <button type="submit">Confirmar os campos e editar o ator/atriz!</button>
                    <!-- Dispara a servlet ControleAtor -->
                </form>
            </div>
        </div><!-- Fechando a div de conteudo -->
        <footer><!-- Rodapé, contem em quase todas as paginas e tem um link para voltar a pagina inicial -->
            <a href="index.jsp" style='color: white; text-decoration: none;'>Copyright © 2019 PopcornTime Grupo J. Todos os direitos reservados.</a>
        </footer>
    </body>
</html>