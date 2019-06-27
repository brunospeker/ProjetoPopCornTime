<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title><!-- Titulo da pagina -->
        <link rel="stylesheet" type="text/css" href="css/reg.css"><!-- Chamando o CSS reg -->
    </head>
    <body style="margin: 0 auto; width: 100%;">
        <div class="caixa"><!-- Contem o conteudo da pagina -->
            <div class="logo">
                <a href="index.jsp"><img src="imagens/logo.png" width="200px" height="50px"></a>
            </div>
            <div class="registroform">
                <form action="RegistroUsuario" method="post">
                    <fieldset>
                        <label for="nome">Nome</label><br>
                        <input type="text" placeholder="Seu nome" id="nome" name="nome" required>
                    </fieldset>
                    <fieldset>
                        <label for="usuario">Usuário</label><br>
                        <input type="text" placeholder="Você irá logar com este usuario" id="usuario" name="usuario" required>
                    </fieldset>
                    <fieldset>
                        <label for="email">Email</label><br>
                        <input type="email" placeholder="seuemail@email.com" id="email" name="email" required>
                    </fieldset>
                    <fieldset>
                        <label for="senha">Senha</label><br>
                        <input type="password" id="senha" name="senha" value="" required>
                    </fieldset>
                    <fieldset>
                        <label for="preferido">URL da foto de perfil:</label><br>
                        <input type="text" id="urlfoto" name="urlfoto" placeholder="Digite o link da foto aqui" required>
                    </fieldset>
                    <fieldset>
                        <input name="confirmar" type="submit" id="adduser" class="confirmar" value="Confirmar cadastro">
                    </fieldset>
                    <!-- Dispara o metodo RegistroUsuario POST para criação de usuarios -->
                </form>
            </div>
            <div class="cprt"><!-- Informando o copyright -->
                <a href="index.jsp">Copyright © 2019 PopcornTime Grupo J.</a>
            </div>
        </div>
    </body>
</html>
