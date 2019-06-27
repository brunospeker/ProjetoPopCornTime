package Controle;

import Modelo.Usuario;
import java.sql.*;
import java.util.*;

public class UsuarioDAO {
    private final Connection bd;
    private final String SQLC = "INSERT INTO usuarios (usuario,nome,email,senha,pin,urlfoto,admin) VALUES (?,?,?,?,?,?,?)";
    private final String SQLR = "SELECT * FROM usuarios WHERE id=?";
    private final String SQLU = "UPDATE usuarios set usuario=?, nome=?, email=?, senha=?, pin=?, urlfoto=?, admin=? WHERE id=?";
    private final String SQLD = "DELETE FROM usuarios WHERE id=?";
    private final String SQLALL = "SELECT * FROM usuarios";

    public UsuarioDAO() { /*Sempre que chamar algum metodo ele abre a conexão com o BD*/
        bd = ConexaoBD.abrir();
    }
    
    public void checkUsuario(Usuario user){ 
/*Metodo util de identificar se existe ou não usuario, se existir ele chama o metodo update, caso não exista chama o metodo que cria*/
        try{
            PreparedStatement ps = bd.prepareStatement("SELECT id FROM usuarios WHERE id=?");
            int id = user.getId();
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                updateUsuario(user);
            }else{
                addUsuario(user);
            }
        }catch(Exception e){
            System.out.println("Erro ao checar Usuario: "+e.getMessage());
        }
    }
    
    public void addUsuario(Usuario user){ /*Metodo para criar usuario no CRUD*/
        
        try{
            PreparedStatement ps = bd.prepareStatement(SQLC);
            ps.setString(1, user.getUsuario());
            ps.setString(2, user.getNome());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getSenha());
            ps.setString(5, user.getPin());
            ps.setString(6, user.getUrlfoto());
            ps.setInt(7, user.getAdmin());
            ps.executeUpdate();
            
            ps.close();
            ConexaoBD.fechar(bd);
        } catch(SQLException sqle){
            System.out.println("Erro no addUsuario no DAO: " + sqle.getMessage());
        }
    }
    
    public void updateUsuario(Usuario user){ /*Metodo pra atualizar um usuario no CRUD*/
        try{
            PreparedStatement ps = bd.prepareStatement(SQLU);
            ps.setString(1, user.getUsuario());
            ps.setString(2, user.getNome());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getSenha());
            ps.setString(5, user.getPin());
            ps.setString(6, user.getUrlfoto());
            ps.setInt(7, user.getAdmin());
            ps.setInt(8, user.getId());
            ps.executeUpdate();
            
            ps.close();
            ConexaoBD.fechar(bd);
        }catch(SQLException sqle){
            System.out.println("Erro no updateUsuario no DAO: " + sqle.getMessage());
        }
    }
    
    public void deleteUsuario(int id){ /*Metodo pra deletar usuario no CRUD*/
        try{
            PreparedStatement ps = bd.prepareStatement(SQLD);
            ps.setInt(1, id);
            ps.executeUpdate();
            
            ps.close();
            ConexaoBD.fechar(bd);
        } catch(SQLException sqle){
            System.out.println("Erro no deletedUsuario no DAO: " + sqle.getMessage());
        }
    }
    
    public Usuario getByIdUsuario(int id){ /*Metodo pra ler um usuario pela id no CRUD*/
        Usuario user = new Usuario();
        try{
            PreparedStatement ps = bd.prepareStatement(SQLR);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                user.setId(rs.getInt("id"));
                user.setUsuario(rs.getString("usuario"));
                user.setNome(rs.getString("nome"));
                user.setEmail(rs.getString("email"));
                user.setSenha(rs.getString("senha"));
                user.setPin(rs.getString("pin"));
                user.setUrlfoto(rs.getString("urlfoto"));
                user.setAcesso(rs.getTimestamp("acesso"));
                user.setAdmin(rs.getInt("admin"));
            }
            rs.close();
            ps.close();
            ConexaoBD.fechar(bd);
        } catch(SQLException sqle){
            System.out.println("Erro no getByIdUsuario no DAO: " + sqle.getMessage());
        }
        return user;
    }
    
    public List<Usuario> getAllUsuarios(){ /*Metodo pra ler todos os usuarios no CRUD*/
        List<Usuario> users = new ArrayList<Usuario>();
        try{
            PreparedStatement ps = bd.prepareStatement(SQLALL);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Usuario u = new Usuario();
                u.setId(rs.getInt("id"));
                u.setUsuario(rs.getString("usuario"));
                u.setNome(rs.getString("nome"));
                u.setEmail(rs.getString("email"));
                u.setSenha(rs.getString("senha"));
                u.setPin(rs.getString("pin"));
                u.setUrlfoto(rs.getString("urlfoto"));
                u.setAcesso(rs.getTimestamp("acesso"));
                u.setAdmin(rs.getInt("admin"));
                users.add(u);
            }
            rs.close();
            ps.close();
            ConexaoBD.fechar(bd);
        } catch(SQLException sqle){
            System.out.println("Erro no getAllUsuarios no DAO: " + sqle.getMessage());
        }
        return users;
    }
    
    public List<Usuario> ultimosUsuariosCadastrados(){ /* Metodo especial criado para ver todos os usuarios de forma decrescente*/
        List<Usuario> users = new ArrayList<Usuario>();
        try{
            PreparedStatement ps = bd.prepareStatement("SELECT * FROM usuarios ORDER BY id DESC");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Usuario u = new Usuario();
                u.setId(rs.getInt("id"));
                u.setUsuario(rs.getString("usuario"));
                u.setNome(rs.getString("nome"));
                u.setEmail(rs.getString("email"));
                u.setSenha(rs.getString("senha"));
                u.setPin(rs.getString("pin"));
                u.setUrlfoto(rs.getString("urlfoto"));
                u.setAcesso(rs.getTimestamp("acesso"));
                u.setAdmin(rs.getInt("admin"));
                users.add(u);
            }
            rs.close();
            ps.close();
            ConexaoBD.fechar(bd);
        } catch(SQLException sqle){
            System.out.println("Erro ao apresentar os ultimos usuarios cadastrados: "+sqle.getMessage());
        }
        return users;
    }
}