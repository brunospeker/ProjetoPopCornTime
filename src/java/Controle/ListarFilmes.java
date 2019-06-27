package Controle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListarFilmes extends HttpServlet {
    /*Servlet simples, só faz citação ao DAO que pega todos os filmes e carrega 
    em um atributo, que depois é enviado para uma pagina ser populado com todos esses filmes*/
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FilmeDAO fdao = new FilmeDAO();
        request.setAttribute("listaFilmes", fdao.getAllFilmes());
        request.getRequestDispatcher("listafilmes.jsp").forward(request, response);
    }
}