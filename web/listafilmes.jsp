<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Filme"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Filmes</title><!-- Titulo da pagina -->
        <link rel="stylesheet" type="text/css" href="css/mainstyle.css"><!-- Chamando o css mainstyle -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!-- Chamando a biblioteca online ajax para utilizar ela no logindrop.js -->
        <script type="text/javascript" src="js/logindrop.js"></script>
    </head>
    <body style="margin: 0 auto; width: 1200px;">
        
        <%@include file="include/header.jsp" %><!-- Inclusão do cabeçalho -->
        
        <div class="content"><!-- Div usada para o conteudo -->
            <div class="listafilme">
                <div class="ordemfilmes">
                    <h3>Lista de todos os filmes</h3>
                    <ul><!-- Pegando um atributo recebido pelo servlet ListarAtores, no qual contei um array
                        E utilizando o Iterator para percorrer todos os elementos deste array, indo populando
                        por onde vai passando.Há outro modo de fazer, porém utilizei este.-->
                    <%
                        ArrayList<Filme> filmes = (ArrayList<Filme>)request.getAttribute("listaFilmes");
                        Iterator iter = filmes.iterator();
                        while(iter.hasNext()){
                            Filme m = (Filme) iter.next();
                    %>
                    <li>
                        <a href="PopFilme?id=<%=m.getIdfilme()%>">
                            <!-- Criando um link para o servlet passando um id de um determinado elemento do
                            ArrayList, fazendo ser enviado para a pagina mostrando somente seu conteudo-->
                            <img src="<%=m.getUrlcartaz()%>" width="150px" height="200px">
                            <div style="color: white;"><%=m.getNomefilme()%></div>
                        </a>
                    </li>
                    <% } %>
                    </ul>
                </div>
            </div>
        </div><!-- Fechando a div de conteudo -->
        <footer><!-- Rodapé, contem em quase todas as paginas e tem um link para voltar a pagina inicial -->
            <a href="index.jsp" style='color: white; text-decoration: none;'>Copyright © 2019 PopcornTime Grupo J. Todos os direitos reservados.</a>
        </footer>
    </body>
</html>