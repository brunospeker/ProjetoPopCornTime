<%@page import="Modelo.Filme"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Pegando o atributo passado pelo servlet PopFilme e populando os campos no decorrer da pagina -->
<%
    Filme f = (Filme)request.getAttribute("Movie");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=f.getNomefilme()%></title><!-- Titulo da pagina -->
        <link rel="stylesheet" type="text/css" href="css/mainstyle.css"><!-- Chamando o css mainstyle -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!-- Chamando a biblioteca online ajax para utilizar ela no logindrop.js -->
        <script type="text/javascript" src="js/logindrop.js"></script>
        <!-- Outro modo de utilizar o JS, pode se implementar dentro do arquivo jsp/html -->
        <script>
            function votar(vt){/*a entrada é o numero da imagem clicada*/
                /*Esta Função manipula as imagens da votação*/
    var v1 = document.getElementById('v1');
    var v2 = document.getElementById('v2');
    var v3 = document.getElementById('v3');
    var v4 = document.getElementById('v4');
    var v5 = document.getElementById('v5');
    var resultado = 0;
    
    if(vt === 5){
        v1.src = "imagens/icon2.png";
        v2.src = "imagens/icon2.png";
        v3.src = "imagens/icon2.png";
        v4.src = "imagens/icon2.png";
        v5.src = "imagens/icon2.png";
        resultado = 5;
    }
    if(vt === 4){
        v1.src = "imagens/icon2.png";
        v2.src = "imagens/icon2.png";
        v3.src = "imagens/icon2.png";
        v4.src = "imagens/icon2.png";
        v5.src = "imagens/icon1.png";
        resultado = 4;
    }
    if(vt === 3){
        v1.src = "imagens/icon2.png";
        v2.src = "imagens/icon2.png";
        v3.src = "imagens/icon2.png";
        v4.src = "imagens/icon1.png";
        v5.src = "imagens/icon1.png";
        resultado = 3;
    }
    if(vt === 2){
        v1.src = "imagens/icon2.png";
        v2.src = "imagens/icon2.png";
        v3.src = "imagens/icon1.png";
        v4.src = "imagens/icon1.png";
        v5.src = "imagens/icon1.png";
        resultado = 2;
    }
    if(vt === 1){
        v1.src = "imagens/icon2.png";
        v2.src = "imagens/icon1.png";
        v3.src = "imagens/icon1.png";
        v4.src = "imagens/icon1.png";
        v5.src = "imagens/icon1.png";
        resultado = 1;
    }
    /*Coloca o resultado dos cliques na timagem no id resultado, sendo manipulada futuramente pelo servlet*/
    document.getElementById("resultado").value = resultado;
    }
        </script>
        <style>
            /*CSS nativo dentro da pagina jsp/html*/
            #confirmarvotofilme{
                width: 245px;
                height: 28px;
                background-color: #f22521;
                color: white;
                border: 2px solid white;
                border-radius: 16px;
            }
            #confirmarvotofilme:hover{
                background-color: #b71c19;
                cursor: pointer;
            }
        </style>
    </head>
    <body style="margin: 0 auto; width: 1200px;">
        
        <%@include file="include/header.jsp" %><!-- Inclusão do cabeçalho -->
        
        <div class="content"><!-- Div usada para o conteudo -->
            <div class="filme"><!-- Começo dos dados populados do filme -->
                <img id="foto" style="width:250px; height:330px;" src="<%=f.getUrlcartaz()%>">
                <div class="detfilme">
                    <h2><%=f.getNomefilme()%></h2>
                    <h4>Data de Lançamento: <%=f.getLancamento()%></h4>
                    <h4>Direção: <%=f.getDirecao()%></h4>
                    <h4>Nacionalidade: <%=f.getPais()%></h4>
                </div>
                <div class="notaf"><!-- Informação sobre a nota do filme -->
                    <%  if(UsuarioLogado.isValid()){  %><!-- Se o usuario na sessão for valido, ele pode votar -->
                    <h3>Diga quantas pipocas este filme merece:</h3>
                    <!-- Uso do JS nativo -->
                    <a onclick="votar(1)"><img id="v1" src="imagens/icon1.png" style="width:30px; height:30px; cursor: pointer;" ></a>
                    <a onclick="votar(2)"><img id="v2" src="imagens/icon1.png" style="width:30px; height:30px; cursor: pointer;"></a>
                    <a onclick="votar(3)"><img id="v3" src="imagens/icon1.png" style="width:30px; height:30px; cursor: pointer;"></a>
                    <a onclick="votar(4)"><img id="v4" src="imagens/icon1.png" style="width:30px; height:30px; cursor: pointer;"></a>
                    <a onclick="votar(5)"><img id="v5" src="imagens/icon1.png" style="width:30px; height:30px; cursor: pointer;"></a>
                    <form action="NotaFilme" method="POST"><!-- Servlet que modifica a nota do filme -->
                        <input type="hidden" id="resultado" name="ResultadoFilme" value="">
                        <input type="hidden" name="IdFilme" value="<%=f.getIdfilme()%>">
                        <!-- Os valores hidden para fazer funcionar a servlet, sem precisar ficar mostrando na tela -->
                        <input type="submit" id="confirmarvotofilme" value="Clique para confirmar o voto no Filme!">
                    </form>
                    <% } %>
                    <p>Media de avaliação: <%=f.getMediafilme()%></p>
                    <p>Numero de votos: <%=f.getVotosfilme()%></p>
                    <p>Numero de avaliadores: <%=f.getVotantesfilme()%></p>
                </div>
            </div>
        </div><!-- Fechando a div de conteudo -->
        <footer><!-- Rodapé, contem em quase todas as paginas e tem um link para voltar a pagina inicial -->
            <a href="index.jsp" style='color: white; text-decoration: none;'>Copyright © 2019 PopcornTime Grupo J. Todos os direitos reservados.</a>
        </footer>
    </body>
</html>