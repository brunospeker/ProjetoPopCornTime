$(document).ready(function(){ /*Le a pagina presente*/
    var down = $(".logindown"); /*Pega a classe logindown*/
    var status = false; /*inicia uma condição*/
    $("#login").click(function(event){/*quando se clica na id login dispara a funcao*/
        event.preventDefault();
        if(status == false){ /*dispara a condição iniciada*/
            down.fadeIn(); /*deixa visivel a div*/
            status = true; /*muda a condição*/
        }
        else{
            down.fadeOut(); /*deixa invisivel a div*/
            status = false; /*muda a condição*/
        }
    });
});