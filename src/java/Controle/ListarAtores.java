package Controle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListarAtores extends HttpServlet {
    /*Servlet simples, só faz citação ao DAO que pega todos os atores e carrega 
    em um atributo, que depois é enviado para uma pagina ser populado com todos esses atores*/
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AtorDAO adao = new AtorDAO();
        request.setAttribute("listaAtores", adao.getAllAtores());
        request.getRequestDispatcher("listaatores.jsp").forward(request, response);
    }
}