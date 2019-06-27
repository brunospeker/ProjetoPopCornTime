package Controle;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NotaFilme extends HttpServlet {
    /*Este servlet é usado para atualizar as notas dos filmes no banco de dados.
    Ele pega os parametros que estão invisiveis na pagina, e faz citação diretamente
    do BD sem recorrer a um DAO(poderia fazer, mas quis fazer diferente neste servlet)
    incrementando com os valores passados na pagina.
    No fim, ele manda para a pagina de aviso com a mensagem.*/
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
        int voto = Integer.parseInt(request.getParameter("ResultadoFilme"));
        int idfilme = Integer.parseInt(request.getParameter("IdFilme"));
        
        Connection con = ConexaoBD.abrir();
        PreparedStatement ps = con.prepareStatement("UPDATE filmes set votosfilme=votosfilme+?, votantesfilme=votantesfilme+1 WHERE idfilme=?");
        ps.setInt(1, voto);
        ps.setInt(2, idfilme);
        ps.executeUpdate();
        
        ps.close();
        ConexaoBD.fechar(con);
        
        request.setAttribute("notificacao", "Voto confirmado com sucesso.<br> Obrigado por votar!");
        request.getRequestDispatcher("/aviso.jsp").forward(request, response);
        
        } catch (SQLException sqle) {
            System.out.println("Erro ao votar: "+sqle.getMessage());
        }
    }
}