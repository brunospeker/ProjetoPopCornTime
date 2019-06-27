package Controle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PopAtor extends HttpServlet {
    /*Quando este servlet é chamado, ele vem com um id de parametro, ele pega esse id
    e joga no dao de carregar um ator pela id, seta como atributo e envia pra uma pagina
    template, para ser carregada/populada a paginas com os dados desse ator por isso o nome "pop"*/
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        AtorDAO adao = new AtorDAO();
        request.setAttribute("Actor", adao.getByIdAtor(id));
        request.getRequestDispatcher("ator.jsp").forward(request, response);
    }
}