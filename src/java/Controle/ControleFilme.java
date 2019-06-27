package Controle;

import Modelo.Filme;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControleFilme extends HttpServlet {
    /*Servlet que cuida do CRUD de filmes, especialmente pelo gerenciamento de um admin*/
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /*O get cuida exclusivamente de receber as ações de update ou delete pelo id do filme selecionado*/
        FilmeDAO dao = new FilmeDAO();
        String action = "";
        try{
            action = request.getParameter("action");
        } catch(Exception e){
            System.out.println("Nenhuma action foi encontrada: "+e.getMessage());
        }
        
        if(action.equalsIgnoreCase("update")){/*se a action for update*/
            int id = Integer.parseInt(request.getParameter("id"));/*ele pega o id*/
            Filme fil = dao.getByIdFilme(id);/*instancia um filme e joga o resultado do dao nele*/
            request.setAttribute("fil", fil);/*carrega o filme em um atributo e joga ele para outra pagina*/
            request.getRequestDispatcher("upfilme.jsp").forward(request, response);
        }
        else if(action.equalsIgnoreCase("delete")){/*se a action for delete*/
            int id = Integer.parseInt(request.getParameter("id"));/*ele pega o id*/
            dao.deleteFilme(id);/*joga o id no dao de deletar*/
            response.sendRedirect("gerenciar.jsp");/*e manda pra pagina gerenciar novamente*/
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /*O post cuida tanto do create quanto das alterações feitas no update do filme
        se tiver um id, ele faz o update, se não faz o create e no fim manda pra uma pagina de aviso*/
        FilmeDAO f = new FilmeDAO();
        Filme movie = new Filme();
        int id = 0;
        try{ /*try que captura o id, se não tiver ele seta outro */
            id = Integer.parseInt(request.getParameter("idfilme"));
            System.out.println(id);
        } catch(Exception e){
            System.out.println("Erro no post de Controle de Filmes: "+e.getMessage());
            id = -2;
        }
        /*Popula os outros campos do filme com os parametros pegados*/
        movie.setIdfilme(id);
        movie.setNomefilme(request.getParameter("nomefilme"));
        movie.setLancamento(request.getParameter("lancamento"));
        movie.setDirecao(request.getParameter("direcao"));
        movie.setPais(request.getParameter("pais"));
        movie.setUrlcartaz(request.getParameter("urlcartaz"));
        
        if(movie.getNomefilme()==null){
            request.setAttribute("notificacao", "Você marcou algum campo errado ou deixou de marcar.");
            request.getRequestDispatcher("aviso.jsp").forward(request, response);
        }else{
            f.checkFilme(movie);/*manda o filme para o DAO de checagem, para ve se é create ou update*/
            request.setAttribute("notificacao", "Cadastro realizado com sucesso.");
            request.getRequestDispatcher("/aviso.jsp").forward(request, response);
        }
    }
}