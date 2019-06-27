package Controle;

import Modelo.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControleUsuario extends HttpServlet {
    /*Servlet que cuida do CRUD de usuarios, especialmente pelo gerenciamento de um admin*/
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /*O get cuida exclusivamente de receber as ações de update ou delete pelo id do usuario selecionado*/
        UsuarioDAO dao = new UsuarioDAO();
        String action = "";
        try{
            action = request.getParameter("action");
        } catch(Exception e){
            System.out.println("Nenhuma action foi encontrada: "+e.getMessage());
        }
        
        if(action.equalsIgnoreCase("update")){/*se a action for update*/
            int id = Integer.parseInt(request.getParameter("id"));/*ele pega o id*/
            Usuario usu = dao.getByIdUsuario(id);/*instancia um usuario e joga o resultado do dao nele*/
            request.setAttribute("usu", usu);/*carrega o usuario em um atributo e joga ele para outra pagina*/
            request.getRequestDispatcher("upusuario.jsp").forward(request, response);
        }
        else if(action.equalsIgnoreCase("delete")){/*se a action for delete*/
            int id = Integer.parseInt(request.getParameter("id"));/*ele pega o id*/
            dao.deleteUsuario(id);/*joga o id no dao de deletar*/
            response.sendRedirect("gerenciar.jsp");/*e manda pra pagina gerenciar novamente*/
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /*O post cuida tanto do create quanto das alterações feitas no update do usuario
        se tiver um id, ele faz o update, se não faz o create e no fim manda pra uma pagina de aviso*/
        UsuarioDAO d = new UsuarioDAO();
        Usuario user = new Usuario();
        int id = 0;
        try{ /*try que captura o id, se não tiver ele seta outro */
            id = Integer.parseInt(request.getParameter("id"));
        } catch(Exception e){
            System.out.println("Erro no post de Controle de Usuarios: "+e.getMessage());
            id= -2;
        }
        /*Popula os outros campos do usuario com os parametros pegados*/
        user.setId(id);
        user.setUsuario(request.getParameter("usuario"));
        user.setNome(request.getParameter("nome"));
        user.setEmail(request.getParameter("email"));
        user.setSenha(request.getParameter("senha"));
        user.setPin(request.getParameter("pin"));
        user.setUrlfoto(request.getParameter("urlfoto"));
        String admin = request.getParameter("admin");
        if(admin == null || "".equals(admin)){
            admin ="0";
        }
        user.setAdmin(Integer.parseInt(admin));
        
        if(user.getUsuario()==null || user.getEmail()==null){
            request.setAttribute("notificacao", "Você marcou algum campo errado ou deixou de marcar.");
            request.getRequestDispatcher("aviso.jsp").forward(request, response);
        }else{
            d.checkUsuario(user);/*manda o usuario para o DAO de checagem, para ve se é create ou update*/
            request.setAttribute("notificacao", "Cadastro realizado com sucesso.");
            request.getRequestDispatcher("/aviso.jsp").forward(request, response);
        }
    }
}
