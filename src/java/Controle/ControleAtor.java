package Controle;

import Modelo.Ator;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControleAtor extends HttpServlet {
    /*Servlet que cuida do CRUD de atores, especialmente pelo gerenciamento de um admin*/
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /*O get cuida exclusivamente de receber as ações de update ou delete pelo id do ator selecionado*/
        AtorDAO dao = new AtorDAO();
        String action = "";
        try{
            action = request.getParameter("action");
        } catch(Exception e){
            System.out.println("Nenhuma action foi encontrada: "+e.getMessage());
        }
        
        if(action.equalsIgnoreCase("update")){/*se a action for update*/
            int id = Integer.parseInt(request.getParameter("id"));/*ele pega o id*/
            Ator ato = dao.getByIdAtor(id);/*instancia um ator e joga o resultado do dao nele*/
            request.setAttribute("ato", ato);/*carrega o ator em um atributo e joga ele para outra pagina*/
            request.getRequestDispatcher("upator.jsp").forward(request, response);
        }
        else if(action.equalsIgnoreCase("delete")){/*se a action for delete*/
            int id = Integer.parseInt(request.getParameter("id"));/*ele pega o id*/
            dao.deleteAtor(id);/*joga o id no dao de deletar*/
            response.sendRedirect("gerenciar.jsp");/*e manda pra pagina gerenciar novamente*/
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /*O post cuida tanto do create quanto das alterações feitas no update do ator
        se tiver um id, ele faz o update, se não faz o create e no fim manda pra uma pagina de aviso*/
        AtorDAO a = new AtorDAO();
        Ator actor = new Ator();
        int id = 0;
        try{ /*try que captura o id, se não tiver ele seta outro */
            id = Integer.parseInt(request.getParameter("idator"));
            System.out.println(id);
        } catch(NumberFormatException e){
            System.out.println("Erro no post de Controle de Atores: "+e.getMessage());
            id = -2;
        }
        /*Popula os outros campos do ator com os parametros pegados*/
        actor.setIdator(id);
        actor.setNomeator(request.getParameter("nomeator"));
        actor.setConjuge(request.getParameter("conjuge"));
        actor.setNacionalidade(request.getParameter("nacionalidade"));
        actor.setNascimento(request.getParameter("nascimento"));
        actor.setUrlretrato(request.getParameter("urlretrato"));
        
        if(actor.getNomeator()==null){
            request.setAttribute("notificacao", "Você marcou algum campo errado ou deixou de marcar.");
            request.getRequestDispatcher("aviso.jsp").forward(request, response);
        }else{
            a.checkAtor(actor);/*manda o ator para o DAO de checagem, para ve se é create ou update*/
            request.setAttribute("notificacao", "Cadastro realizado com sucesso.");
            request.getRequestDispatcher("/aviso.jsp").forward(request, response);
        }
    }
}