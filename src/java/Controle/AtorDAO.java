package Controle;

import Modelo.Ator;
import java.sql.*;
import java.util.*;

public class AtorDAO {
    private final Connection bd;
    private final String SQLC = "INSERT INTO atores (nomeator,conjuge,nacionalidade,nascimento,urlretrato) VALUES (?,?,?,?,?)";
    private final String SQLR = "SELECT * FROM atores WHERE idator=?";
    private final String SQLU = "UPDATE atores set nomeator=?, conjuge=?, nacionalidade=?, nascimento=?, urlretrato=? WHERE idator=?";
    private final String SQLD = "DELETE FROM atores WHERE idator=?";
    private final String SQLALL = "SELECT * FROM atores";

    public AtorDAO() { /*Sempre que chamar algum metodo ele abre a conexão com o BD*/
        bd = ConexaoBD.abrir();
    }
    
    public void checkAtor(Ator actor){
/*Metodo util de identificar se existe ou não ator, se existir ele chama o metodo update, caso não exista chama o metodo que cria*/
        try{
            PreparedStatement ps = bd.prepareStatement("SELECT idator FROM atores WHERE idator=?");
            int id = actor.getIdator();
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                updateAtor(actor);
            } else {
                addAtor(actor);
            }
        }catch(Exception e){
            System.out.println("Erro ao checar Ator: "+e.getMessage());
        }
    }
    
    public void addAtor(Ator actor){ /*Metodo para criar ator no CRUD*/
        try{
            PreparedStatement ps = bd.prepareStatement(SQLC);
            ps.setString(1, actor.getNomeator());
            ps.setString(2, actor.getConjuge());
            ps.setString(3, actor.getNacionalidade());
            ps.setString(4, actor.getNascimento());
            ps.setString(5, actor.getUrlretrato());
            ps.executeUpdate();
            
            ps.close();
            ConexaoBD.fechar(bd);
            
        } catch(SQLException sqle){
            System.out.println("Erro no addAtor no DAO: " + sqle.getMessage());
        }
    }
    
    public void updateAtor(Ator actor){ /*Metodo pra atualizar um ator no CRUD*/
        try{
            PreparedStatement ps = bd.prepareStatement(SQLU);
            ps.setString(1, actor.getNomeator());
            ps.setString(2, actor.getConjuge());
            ps.setString(3, actor.getNacionalidade());
            ps.setString(4, actor.getNascimento());
            ps.setString(5, actor.getUrlretrato());
            ps.setInt(6, actor.getIdator());
            ps.executeUpdate();
            
            ps.close();
            ConexaoBD.fechar(bd);
            
        }catch(SQLException sqle){
            System.out.println("Erro no updateAtor no DAO: " + sqle.getMessage());
        }
    }
    
    public void deleteAtor(int id){ /*Metodo pra deletar ator no CRUD*/
        try{
            PreparedStatement ps = bd.prepareStatement(SQLD);
            ps.setInt(1, id);
            ps.executeUpdate();
            
            ps.close();
            ConexaoBD.fechar(bd);
        } catch(SQLException sqle){
            System.out.println("Erro no deletedAtor no DAO: " + sqle.getMessage());
        }
    }
    
    public Ator getByIdAtor(int id){ /*Metodo pra ler um ator pela id no CRUD*/
        Ator actor = new Ator();
        try{
            PreparedStatement ps = bd.prepareStatement(SQLR);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                actor.setIdator(rs.getInt("idator"));
                actor.setNomeator(rs.getString("nomeator"));
                actor.setConjuge(rs.getString("conjuge"));
                actor.setNacionalidade(rs.getString("nacionalidade"));
                actor.setNascimento(rs.getString("nascimento"));
                actor.setUrlretrato(rs.getString("urlretrato"));
                actor.setVotosator(rs.getDouble("votosator"));
                actor.setVotantesator(rs.getDouble("votantesator"));
                actor.setMediaator(rs.getDouble("mediaator"));
            }
            rs.close();
            ps.close();
            ConexaoBD.fechar(bd);
        } catch(SQLException sqle){
            System.out.println("Erro no getByIdAtor no DAO: " + sqle.getMessage());
        }
        return actor;
    }
    
    public List<Ator> getAllAtores(){ /*Metodo pra ler todos os atores no CRUD*/
        List<Ator> actors = new ArrayList<Ator>();
        try{
            PreparedStatement ps = bd.prepareStatement(SQLALL);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Ator a = new Ator();
                a.setIdator(rs.getInt("idator"));
                a.setNomeator(rs.getString("nomeator"));
                a.setConjuge(rs.getString("conjuge"));
                a.setNacionalidade(rs.getString("nacionalidade"));
                a.setNascimento(rs.getString("nascimento"));
                a.setUrlretrato(rs.getString("urlretrato"));
                a.setVotosator(rs.getDouble("votosator"));
                a.setVotantesator(rs.getDouble("votantesator"));
                a.setMediaator(rs.getDouble("mediaator"));
                actors.add(a);
            }
            rs.close();
            ps.close();
            ConexaoBD.fechar(bd);
        } catch(SQLException sqle){
            System.out.println("Erro no getAllAtores no DAO: " + sqle.getMessage());
        }
        return actors;
    }
    
    public List<Ator> melhorMediaAtor(){ /*metodo especial que pega os 10 atores com maior media*/
        List<Ator> actors = new ArrayList<Ator>();
        try{
            PreparedStatement ps = bd.prepareStatement("SELECT * FROM atores ORDER BY mediaator DESC FETCH FIRST 10 ROWS ONLY");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Ator a = new Ator();
                a.setIdator(rs.getInt("idator"));
                a.setNomeator(rs.getString("nomeator"));
                a.setConjuge(rs.getString("conjuge"));
                a.setNacionalidade(rs.getString("nacionalidade"));
                a.setNascimento(rs.getString("nascimento"));
                a.setUrlretrato(rs.getString("urlretrato"));
                a.setVotosator(rs.getDouble("votosator"));
                a.setVotantesator(rs.getDouble("votantesator"));
                a.setMediaator(rs.getDouble("mediaator"));
                actors.add(a);
            }
            rs.close();
            ps.close();
            ConexaoBD.fechar(bd);
        } catch(SQLException sqle){
            System.out.println("Erro nas 10 melhores medias: "+sqle.getMessage());
        }
        return actors;
    }
}
