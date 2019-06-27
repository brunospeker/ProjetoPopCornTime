<!-- Pagina de aviso serve universalmente, qualquer aviso que disparamos é mandado para cá -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aviso</title><!-- Titulo da pagina -->
        <link rel="stylesheet" type="text/css" href="css/reg.css"><!-- Chamando o CSS reg -->
    </head>
    <body style="margin: 0 auto; width: 100%;">
        <div class="caixa"><!-- Contem o conteudo da pagina -->
            <div class="logo">
                <a href="index.jsp"><img src="imagens/logo.png" width="200px" height="50px"></a>
            </div>
            <div class="aviso">
                <!-- Recebe dos servlets a notificação/aviso e mostra a mensagem para o ususario -->
                <h2>${notificacao}</h2>
            </div>
            <div class="cprt"><!-- Informando o copyright -->
                <a href="index.jsp">Copyright © 2019 PopcornTime Grupo J.</a>
            </div>
        </div>
    </body>
</html>
