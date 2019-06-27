package Controle;

import Modelo.Usuario;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginUsuario extends HttpServlet {
    /*Servlet que faz o login de usuarios.
    Ele pega os parametros diretamente do form, e cria um novo usuario.
    Depois tenta buscar no BD parametros passados no form. Se obter resultado
    ele popula o usuario criado com resultado do BD e da um Valid(true), se não
    ele da um valid false. Se o usuario estiver com o Valid(true) ele carrega o
    Usuario na sessão e envia para a pagina principal. Se não envia para a 
    pagina de aviso com mensagem de erro.*/
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String usuario = request.getParameter("usuario");
            String senha = request.getParameter("senha");
            Usuario log = new Usuario();
            
            Connection con = ConexaoBD.abrir();
            String slq = "SELECT * from usuarios where usuario='"+usuario+"' AND senha='"+senha+"'";
            PreparedStatement ps = con.prepareStatement(slq);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                log.setId(rs.getInt("id"));
                log.setUsuario(rs.getString("usuario"));
                log.setNome(rs.getString("nome"));
                log.setEmail(rs.getString("email"));
                log.setSenha(rs.getString("senha"));
                log.setPin(rs.getString("pin"));
                log.setUrlfoto(rs.getString("urlfoto"));
                log.setAcesso(rs.getTimestamp("acesso"));
                log.setAdmin(rs.getInt("admin"));
                log.setValid(true);
            }
            else{
                System.out.println("Usuario ou senha incorreta!");
                log.setValid(false);
            }
            rs.close();
            ps.close();
            ConexaoBD.fechar(con);
            
            if(log.isValid()){
                HttpSession session = request.getSession(true);
                System.out.println("Sessão Estabelecida com sucesso!");
                session.setAttribute("UsuarioLogado", log);
                response.sendRedirect("index.jsp");
            }
            else{
                request.setAttribute("notificacao", "Usuario ou senha incorreta!");
                request.getRequestDispatcher("aviso.jsp").forward(request, response);
            }
        } catch(IOException | SQLException | ServletException e){
            System.out.println("Erro ao Logar Usuario: "+e.getMessage());
        }
    }
}