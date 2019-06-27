package Controle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PopFilme extends HttpServlet {
    /*Quando este servlet é chamado, ele vem com um id de parametro, ele pega esse id
    e joga no dao de carregar um filme pela id, seta como atributo e envia pra uma pagina
    template, para ser carregada/populada a paginas com os dados desse filme por isso o nome "pop"*/
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        FilmeDAO fdao = new FilmeDAO();
        request.setAttribute("Movie", fdao.getByIdFilme(id));
        request.getRequestDispatcher("filme.jsp").forward(request, response);
    }
}