<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adicionar Ator/Atriz</title><!-- Titulo da pagina -->
        <link rel="stylesheet" type="text/css" href="css/mainstyle.css"><!-- Chamando o css mainstyle -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!-- Chamando a biblioteca online ajax para utilizar ela no logindrop.js -->
        <script type="text/javascript" src="js/logindrop.js"></script>
    </head>
    <body style="margin: 0 auto; width: 1200px;">
        
        <%@include file="include/header.jsp" %><!-- Inclusão do cabeçalho -->
        
        <div class="content"><!-- Div usada para o conteudo -->
            <div class="CRU">
                <form action="ControleAtor" method="POST">
                    <!-- Alguns input com disable, pois são criados automaticamente pelo BD -->
                    <fieldset>
                        <label>ID:</label>
                        <input disabled="disabled" name="idator" value="">
                    </fieldset>
                    <fieldset>
                        <label>Nome do Ator/Atriz:</label>
                        <input type="text" name="nomeator" value="">
                    </fieldset>
                    <fieldset>
                        <label>Conjuge:</label>
                        <input type="text" name="conjuge" value="">
                    </fieldset>
                    <fieldset>
                        <label>Nacionalidade:</label>
                        <input type="text" name="nacionalidade" value="">
                    </fieldset>
                    <fieldset>
                        <label>Data de Nascimento:</label>
                        <input type="text" name="nascimento" value="">
                    </fieldset>
                    <fieldset>
                        <label>Foto do Ator/Atriz:</label>
                        <input type="text" name="urlretrato" value="">
                    </fieldset>
                    <fieldset>
                        <label>Quantidade de votos:</label>
                        <input disabled="disabled" name="votosator" value="">
                    </fieldset>
                    <fieldset>
                        <label>Quantidade de votantes:</label>
                        <input disabled="disabled" name="votantesator" value="">
                    </fieldset>
                    <fieldset>
                        <label>Media de votos:</label>
                        <input disabled="disabled" name="mediaator" value="">
                    </fieldset>
                    <button>Confirmar os campos e adicionar o ator/atriz!</button>
                    <!-- Dispara o servlet ControleAtor -->
                </form>
            </div>
        </div><!-- Fechando a div de conteudo -->
        <footer><!-- Rodapé, contem em quase todas as paginas e tem um link para voltar a pagina inicial -->
            <a href="index.jsp" style='color: white; text-decoration: none;'>Copyright © 2019 PopcornTime Grupo J. Todos os direitos reservados.</a>
        </footer>
    </body>
</html>
