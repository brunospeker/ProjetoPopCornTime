<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Criando e pegando o usuario na sessão -->
<jsp:useBean id="UsuarioLogado" class="Modelo.Usuario" scope="session">
</jsp:useBean>
<body>
    <header><!-- Cabeçalho feito separadamente, pois se repete em varias paginas -->
        <div class="logo"><!-- Div separando a area correspondente do logotipo -->
            <a href="index.jsp"><!-- Logotipo clicavel que redireciona para a pagina principal -->
                <img src="imagens/logo.png" alt="PopcornTime" width="200px" height="50px">
            </a>
        </div>
        <div class="menu"><!-- Div separando a area correspondente do menu -->
            <a href="ListarFilmes">Filmes</a><!-- Link que leva a lista de filmes -->
            <a href="ListarAtores">Atores</a><!-- Link que leva a lista de atores -->
        </div>
        <div class="gerandlogin"><!-- Div separando a area correspondente do login e gerenciamento -->
            <% if (UsuarioLogado.getAdmin() == 1) { %><!-- O botão de gerenciamento só aparece se o usuario da sessão for admin -->
            <div class="gerenciar"><!-- Div separando o gerenciamento do login -->
                <button onclick="location.href='gerenciar.jsp';">Gerenciar conteúdos</button> <!-- Botão redireciona a pagina de gerenciamento -->
            </div>
            <% } %>
            <div class="login"><!-- Div que divide a parte de login -->
                <!-- Caso o usuario na sessão for valido, aparece o nome "perfil", se não aparece o Login para ele efetuar -->
                <span class="clicklogin" id="login"><% if(UsuarioLogado.isValid()){ %> Perfil <% }else{ %> Login <% } %></span>
                <div class="logindown"><!-- Div que interage com o logindrop.js, ao clicar no span ele aparece -->
                        <% if(UsuarioLogado.isValid()==false){ %><!-- Se não tiver um usuario valido na sessão, aparece para efetuar o login -->
                    <form id="loginform" action="LoginUsuario" method="POST"><!-- Chamando o servlet LoginUsuario -->
                        <div>
                            <label>Usuário:</label><br><!-- O imput com o required substitui um possivel JS que imperia caso estivesse campo nulo -->
                            <input type="text" placeholder="Usuario" id="usuario" name="usuario" required>
                        </div>
                        <div>
                            <label>Senha:</label><br><!-- Required igual o comentario anterior -->
                            <input type="password" placeholder="Senha" id="senha" name="senha" required>
                        </div>
                        <div>
                            <input type="submit" value="Entrar"><!-- submit enviando os parametros para o servlet LoginUsuario -->
                        </div>
                        <div>
                            <a class="fora" href="registro.jsp">Criar uma conta</a><!-- Botão que leva a uma pagina em separado de criação de conta -->
                        </div>
                    </form>
                        <% }else{ %><!-- Se tiver um usuario valido, aparece o perfil dele ou para efetuar o logout -->
                        <form id="loginform" action="LogoutUsuario" method="POST">
                        <div>                                                    <!-- Acessa o perfil  com a id do usuario logado -->
                            <a class="fora" href="PopUsuario?id=<%=UsuarioLogado.getId()%>" style="padding: 3px 48px;">Meu perfil</a>
                        </div>
                        <div>
                            <input type="submit" value="Sair"><!-- Chama a servlet LogoutUsuario para efetuar logout -->
                        </div>
                        </form>
                        <% } %>

                </div>
            </div>
        </div>
    </header>
</body>
