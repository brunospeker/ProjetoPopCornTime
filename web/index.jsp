<!-- Conjunto de importações necessarias para o modo que foi feito a pagina -->
<%@page import="Modelo.Ator"%>
<%@page import="Controle.AtorDAO"%>
<%@page import="Modelo.Filme"%>
<%@page import="Controle.FilmeDAO"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Controle.UsuarioDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Popcorn Time</title><!-- Titulo da pagina -->
        <link rel="stylesheet" type="text/css" href="css/mainstyle.css"><!-- Chamando o css mainstyle -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!-- Chamando a biblioteca online ajax para utilizar ela no logindrop.js -->
        <script type="text/javascript" src="js/logindrop.js"></script>
        <!-- Outro modo de utilizar o JS, pode se implementar dentro do arquivo jsp/html -->
        <script>
            var u=0; /*Inicializando a  variavel*/
            function ufdir(){ /*Função para mover o conteudo para a direita*/
                if(u < -1000) /*Se passar de um certo limite ela vai para o inicio*/
                    u=0;
                else
                    u-=180; /*decrementando a variavel*/
                /*transformando ela em diversos navegadores, utilizando a variavel e modificando o css dela*/
                document.getElementById("blocofilmef").style.WebkitTransform = "translate3d("+u+"px,0,0)";
                document.getElementById("blocofilmef").style.msTransform = "translate3d("+u+"px,0,0)";
                document.getElementById("blocofilmef").style.transform = "translate3d("+u+"px,0,0)";
            }
            function ufesq() /*Função que move o conteudo para a esquerda*/
                {if(u > 0) /*Se voltar demais ela vai pro fim*/
                    u=-1000;
                else
                    u+=180; /*incrementando a variavel*/
                /*transformando ela em diversos navegadores, utilizando a variavel e modificando o css dela*/
                document.getElementById("blocofilmef").style.WebkitTransform = "translate3d("+u+"px,0,0)";
                document.getElementById("blocofilmef").style.msTransform = "translate3d("+u+"px,0,0)";
                document.getElementById("blocofilmef").style.transform = "translate3d("+u+"px,0,0)";
            }
            var f=0;
            function mfdir(){ /*Função para mover o conteudo para a direita*/
                if(f < -1000) /*Se passar de um certo limite ela vai para o inicio*/
                    f=0;
                else
                    f-=180; /*decrementando a variavel*/
                /*transformando ela em diversos navegadores, utilizando a variavel e modificando o css dela*/
                document.getElementById("blocofilmem").style.WebkitTransform = "translate3d("+f+"px,0,0)";
                document.getElementById("blocofilmem").style.msTransform = "translate3d("+f+"px,0,0)";
                document.getElementById("blocofilmem").style.transform = "translate3d("+f+"px,0,0)";
            }
            function mfesq() /*Função que move o conteudo para a esquerda*/
                {if(f > 0) /*Se voltar demais ela vai pro fim*/
                    f=-1000;
                else
                    f+=180; /*incrementando a variavel*/
                /*transformando ela em diversos navegadores, utilizando a variavel e modificando o css dela*/
                document.getElementById("blocofilmem").style.WebkitTransform = "translate3d("+f+"px,0,0)";
                document.getElementById("blocofilmem").style.msTransform = "translate3d("+f+"px,0,0)";
                document.getElementById("blocofilmem").style.transform = "translate3d("+f+"px,0,0)";
            }
            var a=0;
            function madir(){ /*Função para mover o conteudo para a direita*/
                if(a < -1000) /*Se passar de um certo limite ela vai para o inicio*/
                    a=0;
                else
                    a-=180; /*decrementando a variavel*/
                /*transformando ela em diversos navegadores, utilizando a variavel e modificando o css dela*/
                document.getElementById("blocoatorm").style.WebkitTransform = "translate3d("+a+"px,0,0)";
                document.getElementById("blocoatorm").style.msTransform = "translate3d("+a+"px,0,0)";
                document.getElementById("blocoatorm").style.transform = "translate3d("+a+"px,0,0)";
            }
            function maesq() /*Função que move o conteudo para a esquerda*/
                {if(a > 0) /*Se voltar demais ela vai pro fim*/
                    a=-1000;
                else
                    a+=180; /*incrementando a variavel*/
                /*transformando ela em diversos navegadores, utilizando a variavel e modificando o css dela*/
                document.getElementById("blocoatorm").style.WebkitTransform = "translate3d("+a+"px,0,0)";
                document.getElementById("blocoatorm").style.msTransform = "translate3d("+a+"px,0,0)";
                document.getElementById("blocoatorm").style.transform = "translate3d("+a+"px,0,0)";
            }
            
        </script>
    </head>
    <body style="margin: 0 auto; width: 1200px;">
        
        <%@include file="include/header.jsp" %><!-- Inclusão do cabeçalho -->
        
        <div class="content"><!-- Div usada para o conteudo -->
            <div class="ultusuarios"><!-- Div que manipula os ultimos usuarios cadastrados -->
                <h2>Ultimos usuarios cadastrados:</h2>
                <!-- Criando e invocando o metodo do dao em uma lista, e usando o iterator
                que é um mecanismo usado com vetores/listas para andar cada elemento.
                Há outro modo de fazer, porém utilizei este.-->
                <%  
                    UsuarioDAO udao = new UsuarioDAO();
                    List<Usuario> usua = udao.ultimosUsuariosCadastrados();
                    Iterator iteruc = usua.iterator();
                    while(iteruc.hasNext()){
                        Usuario u = (Usuario) iteruc.next();
                %>
                <div class="uusuarios"><!-- Preenchendo com os itens invocados no metodo -->
                    <a href="PopUsuario?id=<%=u.getId()%>" style="color: blue; text-decoration: none;"><%=u.getUsuario()%> realizou o cadastro em:</a>
                    <p><%=u.getAcesso()%></p>
                </div>
                <% } %>
            </div>
            
            <div class="ultfilmes"><!-- Div que manipula os ultimos filmes -->
                <h1>Ultimos filmes:</h1>
                <div class="moveru">
                    <a class="esq" onclick="ufesq()">◀</a><!-- utilização do js nativo da pagina -->
                    <a class="dir" onclick="ufdir()">▶</a><!-- utilização do js nativo da pagina -->
                </div>
                <div class="bloco">
                    <div class="blocofilme" id="blocofilmef"><!-- Class que o JS nativo manipula -->
                <!-- Criando e invocando o metodo do dao em uma lista, e usando o iterator
                que é um mecanismo usado com vetores/listas para andar cada elemento.
                Há outro modo de fazer, porém utilizei este.-->
                        <%  
                            FilmeDAO fdao = new FilmeDAO();
                            List<Filme> filmes = fdao.dezUltimos();
                            Iterator iterf = filmes.iterator();
                            while(iterf.hasNext()){
                                Filme f = (Filme) iterf.next();
                        %>
                        <div class="nfilme"><!-- Preenchendo com os itens invocados no metodo -->
                            <a href="PopFilme?id=<%=f.getIdfilme()%>" style="color: white; text-decoration: none;"><img src="<%=f.getUrlcartaz()%>" width="150px" height="200px"><br><%=f.getNomefilme()%></a>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
            
            <div class="melhoresfilmes">
                <h1>Filmes com melhor nota:</h1>
                <div class="moverf">
                    <a class="esq" onclick="mfesq()">◀</a><!-- utilização do js nativo da pagina -->
                    <a class="dir" onclick="mfdir()">▶</a><!-- utilização do js nativo da pagina -->
                </div>
                <div class="bloco">
                    <div class="blocomfilme" id="blocofilmem"><!-- Class que o JS nativo manipula -->
                <!-- Criando e invocando o metodo do dao em uma lista, e usando o iterator
                que é um mecanismo usado com vetores/listas para andar cada elemento.
                Há outro modo de fazer, porém utilizei este.-->
                        <%  
                            FilmeDAO fmdao = new FilmeDAO();
                            List<Filme> mfilmes = fmdao.melhorMediaFilme();
                            Iterator iterfm = mfilmes.iterator();
                            while(iterfm.hasNext()){
                                Filme f = (Filme) iterfm.next();
                        %>
                        <div class="mfilme"><!-- Preenchendo com os itens invocados no metodo -->
                            <a href="PopFilme?id=<%=f.getIdfilme()%>" style="color: white; text-decoration: none;"><img src="<%=f.getUrlcartaz()%>" width="150px" height="200px"><br><%=f.getNomefilme()%></a>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
            
            <div class="melhoresatores">
                <h1>Atores com melhor nota:</h1>
                <div class="movera">
                    <a class="esq" onclick="maesq()">◀</a><!-- utilização do js nativo da pagina -->
                    <a class="dir" onclick="madir()">▶</a><!-- utilização do js nativo da pagina -->
                </div>
                <div class="bloco">
                    <div class="blocoator" id="blocoatorm"><!-- Class que o JS nativo manipula -->
                <!-- Criando e invocando o metodo do dao em uma lista, e usando o iterator
                que é um mecanismo usado com vetores/listas para andar cada elemento.
                Há outro modo de fazer, porém utilizei este.-->
                        <%  
                            AtorDAO adao = new AtorDAO();
                            List<Ator> mator = adao.melhorMediaAtor();
                            Iterator iteram = mator.iterator();
                            while(iteram.hasNext()){
                                Ator a = (Ator) iteram.next();
                        %>
                        <div class="nator"><!-- Preenchendo com os itens invocados no metodo -->
                            <a href="PopAtor?id=<%=a.getIdator()%>" style="color: white; text-decoration: none;"><img src="<%=a.getUrlretrato()%>" width="150px" height="200px"><br><%=a.getNomeator()%></a>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div><!-- Fechando a div de conteudo -->
        <footer><!-- Rodapé, contem em quase todas as paginas e tem um link para voltar a pagina inicial -->
            <a href="index.jsp" style='color: white; text-decoration: none;'>Copyright © 2019 PopcornTime Grupo J. Todos os direitos reservados.</a>
        </footer>
    </body>
</html>