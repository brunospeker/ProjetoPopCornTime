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
        <title>Gerenciamento de Conteudo</title><!-- Titulo da pagina -->
        <link rel="stylesheet" type="text/css" href="css/mainstyle.css"><!-- Chamando o css mainstyle -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!-- Chamando a biblioteca online ajax para utilizar ela no logindrop.js -->
        <script type="text/javascript" src="js/logindrop.js"></script>
    </head>
    <body style="margin: 0 auto; width: 1200px;">
        
        <%@include file="include/header.jsp" %><!-- Inclusão do cabeçalho -->
        
        <div class="content"><!-- Div usada para o conteudo -->
            <div class="gerenciarusuarios">
                <h2>Gerenciar Usuarios</h2>
                <button onclick="location.href='addusuario.jsp'";>Adicionar Usuario</button>
                <div>
                    <table>
                        <tr><!-- Indices da tabela de Usuarios -->
                            <th>ID</th>
                            <th>Usuario</th>
                            <th>Nome</th>
                            <th>Email</th>
                            <th>Criação</th>
                            <th>Admin</th>
                            <th colspan='2'>Opções</th>
                        </tr>
            <!-- Criando o dao e invocando o metodo do dao em uma lista, e usando o iterator
            que é um mecanismo usado com vetores/listas para andar cada elemento.
            Há outro modo de fazer, porém utilizei este.-->
                        <%  
                            UsuarioDAO udao = new UsuarioDAO();
                            List<Usuario> usuarios = udao.getAllUsuarios();
                            Iterator iteru = usuarios.iterator();
                            while(iteru.hasNext()){
                                Usuario u = (Usuario) iteru.next();
                        %>
                            <tr>
                                <td><%=u.getId()%></td>
                                <td><%=u.getUsuario()%></td>
                                <td><%=u.getNome()%></td>
                                <td><%=u.getEmail()%></td>
                                <td><%=u.getAcesso()%></td>
                                <td><%=u.getAdmin()%></td>
                                <td><a href="ControleUsuario?action=update&id=<%=u.getId()%>">Editar</a></td>
                                <td><a href="ControleUsuario?action=delete&id=<%=u.getId()%>">Deletar</a></td>
                <!-- Usando o servlet ControleUsuario get para fazer update e deletar deteminado Usuario -->
                            </tr>
                        <% } %>
                    </table>
                </div>
            </div><!-- Fechando div de Gerenciamento de Usuarios -->
            
            <div class="gerenciarfilmes">
                <h2>Gerenciar Filmes</h2>
                <button onclick="location.href='addfilme.jsp'";>Adicionar Filmes</button>
                <div>
                    <table>
                        <tr><!-- Indices da tabela de Filmes -->
                            <th>ID</th>
                            <th>Nome do filme</th>
                            <th>Data de lançamento</th>
                            <th>Direção</th>
                            <th>Nacionalidade</th>
                            <th>Qnt de Votos</th>
                            <th>Qnt de Votantes</th>
                            <th>Media de votos</th>
                            <th colspan='2'>Opções</th>
                        </tr>
            <!-- Criando o dao e invocando o metodo do dao em uma lista, e usando o iterator
            que é um mecanismo usado com vetores/listas para andar cada elemento.
            Há outro modo de fazer, porém utilizei este.-->
                        <%  
                            FilmeDAO fdao = new FilmeDAO();
                            List<Filme> filmes = fdao.getAllFilmes();
                            Iterator iterf = filmes.iterator();
                            while(iterf.hasNext()){
                                Filme f = (Filme) iterf.next();
                        %>
                            <tr>
                                <td><%=f.getIdfilme()%></td>
                                <td><%=f.getNomefilme()%></td>
                                <td><%=f.getLancamento()%></td>
                                <td><%=f.getDirecao()%></td>
                                <td><%=f.getPais()%></td>
                                <td><%=f.getVotosfilme()%></td>
                                <td><%=f.getVotantesfilme()%></td>
                                <td><%=f.getMediafilme()%></td>
                                <td><a href="ControleFilme?action=update&id=<%=f.getIdfilme()%>">Editar</a></td>
                                <td><a href="ControleFilme?action=delete&id=<%=f.getIdfilme()%>">Deletar</a></td>
                <!-- Usando o servlet ControleFilme get para fazer update e deletar deteminado Filme -->
                            </tr>
                        <% } %>
                    </table>
                </div>
            </div><!-- Fechando div de Gerenciamento de Filmes -->
            
            <div class="gerenciaratores">
                <h2>Gerenciar Atores</h2>
                <button onclick="location.href='addator.jsp'";>Adicionar Atores</button>
                <div>
                    <table>
                        <tr><!-- Indices da tabela de Atores -->
                            <th>ID</th>
                            <th>Nome do Ator</th>
                            <th>Conjuge</th>
                            <th>Nacionalidade</th>
                            <th>Nascimento</th>
                            <th>Qnt de Votos</th>
                            <th>Qnt de Votantes</th>
                            <th>Media de votos</th>
                            <th colspan='2'>Opções</th>
                        </tr>
            <!-- Criando o dao e invocando o metodo do dao em uma lista, e usando o iterator
            que é um mecanismo usado com vetores/listas para andar cada elemento.
            Há outro modo de fazer, porém utilizei este.-->
                        <%
                            AtorDAO adao = new AtorDAO();
                            List<Ator> atores = adao.getAllAtores();
                            Iterator itera = atores.iterator();
                            while(itera.hasNext()){
                                Ator a = (Ator) itera.next();
                        %>
                            <tr>
                                <td><%=a.getIdator()%></td>
                                <td><%=a.getNomeator()%></td>
                                <td><%=a.getConjuge()%></td>
                                <td><%=a.getNacionalidade()%></td>
                                <td><%=a.getNascimento()%></td>
                                <td><%=a.getVotosator()%></td>
                                <td><%=a.getVotantesator()%></td>
                                <td><%=a.getMediaator()%></td>
                                <td><a href="ControleAtor?action=update&id=<%=a.getIdator()%>">Editar</a></td>
                                <td><a href="ControleAtor?action=delete&id=<%=a.getIdator()%>">Deletar</a></td>
                <!-- Usando o servlet ControleAtor get para fazer update e deletar deteminado Ator -->
                            </tr>
                        <% } %>
                    </table>
                </div>
            </div><!-- Fechando div de Gerenciamento de Atores -->
        </div><!-- Fechando a div de conteudo -->
        <footer><!-- Rodapé, contem em quase todas as paginas e tem um link para voltar a pagina inicial -->
            <a href="index.jsp" style='color: white; text-decoration: none;'>Copyright © 2019 PopcornTime Grupo J. Todos os direitos reservados.</a>
        </footer>
    </body>
</html>