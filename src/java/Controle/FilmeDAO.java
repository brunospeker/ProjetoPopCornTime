package Controle;

import Modelo.Filme;
import java.sql.*;
import java.util.*;

public class FilmeDAO {
    private final Connection bd;
    private final String SQLC = "INSERT INTO filmes (nomefilme,lancamento,direcao,pais,urlcartaz) VALUES (?,?,?,?,?)";
    private final String SQLR = "SELECT * FROM filmes WHERE idfilme=?";
    private final String SQLU = "UPDATE filmes set nomefilme=?, lancamento=?, direcao=?, pais=?, urlcartaz=? WHERE idfilme=?";
    private final String SQLD = "DELETE FROM filmes WHERE idfilme=?";
    private final String SQLALL = "SELECT * FROM filmes";

    public FilmeDAO() { /*Sempre que chamar algum metodo ele abre a conexão com o BD*/
        bd = ConexaoBD.abrir();
    }
    
    public void checkFilme(Filme movie){
/*Metodo util de identificar se existe ou não filme, se existir ele chama o metodo update, caso não exista chama o metodo que cria*/
        try{
            PreparedStatement ps = bd.prepareStatement("SELECT idfilme FROM filmes WHERE idfilme=?");
            int id = movie.getIdfilme();
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                updateFilme(movie);
            }else{
                addFilme(movie);
            }
        }catch(Exception e){
            System.out.println("Erro ao checar Filme: "+e.getMessage());
        }
    }
    
    public void addFilme(Filme movie){ /*Metodo para criar filme no CRUD*/
        try{
            PreparedStatement ps = bd.prepareStatement(SQLC);
            ps.setString(1, movie.getNomefilme());
            ps.setString(2, movie.getLancamento());
            ps.setString(3, movie.getDirecao());
            ps.setString(4, movie.getPais());
            ps.setString(5, movie.getUrlcartaz());
            ps.executeUpdate();
            
            ps.close();
            ConexaoBD.fechar(bd);
        } catch(SQLException sqle){
            System.out.println("Erro no addFilme no DAO: " + sqle.getMessage());
        }
    }
    
    public void updateFilme(Filme movie){ /*Metodo pra atualizar um filme no CRUD*/
        try{
            PreparedStatement ps = bd.prepareStatement(SQLU);
            ps.setString(1, movie.getNomefilme());
            ps.setString(2, movie.getLancamento());
            ps.setString(3, movie.getDirecao());
            ps.setString(4, movie.getPais());
            ps.setString(5, movie.getUrlcartaz());
            ps.setInt(6, movie.getIdfilme());
            ps.executeUpdate();
            
            ps.close();
            ConexaoBD.fechar(bd);
        }catch(SQLException sqle){
            System.out.println("Erro no updateFilme no DAO: " + sqle.getMessage());
        }
    }
    
    public void deleteFilme(int id){ /*Metodo pra deletar filme no CRUD*/
        try{
            PreparedStatement ps = bd.prepareStatement(SQLD);
            ps.setInt(1, id);
            ps.executeUpdate();
            
            ps.close();
            ConexaoBD.fechar(bd);
        } catch(SQLException sqle){
            System.out.println("Erro no deletedFilme no DAO: " + sqle.getMessage());
        }
    }
    
    public Filme getByIdFilme(int id){ /*Metodo pra ler um filme pela id no CRUD*/
        Filme movie = new Filme();
        try{
            PreparedStatement ps = bd.prepareStatement(SQLR);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                movie.setIdfilme(rs.getInt("idfilme"));
                movie.setNomefilme(rs.getString("nomefilme"));
                movie.setLancamento(rs.getString("lancamento"));
                movie.setDirecao(rs.getString("direcao"));
                movie.setPais(rs.getString("pais"));
                movie.setUrlcartaz(rs.getString("urlcartaz"));
                movie.setVotosfilme(rs.getDouble("votosfilme"));
                movie.setVotantesfilme(rs.getDouble("votantesfilme"));
                movie.setMediafilme(rs.getDouble("mediafilme"));
            }
            rs.close();
            ps.close();
            ConexaoBD.fechar(bd);
        } catch(SQLException sqle){
            System.out.println("Erro no getByIdFilme no DAO: " + sqle.getMessage());
        }
        return movie;
    }
    
    public List<Filme> getAllFilmes(){ /*Metodo pra ler todos os filmes no CRUD*/
        List<Filme> movies = new ArrayList<Filme>();
        try{
            PreparedStatement ps = bd.prepareStatement(SQLALL);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Filme m = new Filme();
                m.setIdfilme(rs.getInt("idfilme"));
                m.setNomefilme(rs.getString("nomefilme"));
                m.setLancamento(rs.getString("lancamento"));
                m.setDirecao(rs.getString("direcao"));
                m.setPais(rs.getString("pais"));
                m.setUrlcartaz(rs.getString("urlcartaz"));
                m.setVotosfilme(rs.getDouble("votosfilme"));
                m.setVotantesfilme(rs.getDouble("votantesfilme"));
                m.setMediafilme(rs.getDouble("mediafilme"));
                movies.add(m);
            }
            rs.close();
            ps.close();
            ConexaoBD.fechar(bd);
        } catch(SQLException sqle){
            System.out.println("Erro no getAllFilme no DAO: " + sqle.getMessage());
        }
        return movies;
    }
    
    public List<Filme> dezUltimos(){ /*Metodo especial que pega os 10 ultimos filmes adicionados*/
        List<Filme> movies = new ArrayList<Filme>();
        try{
            PreparedStatement ps = bd.prepareStatement("SELECT * FROM filmes ORDER BY idfilme DESC FETCH FIRST 10 ROWS ONLY");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Filme m = new Filme();
                m.setIdfilme(rs.getInt("idfilme"));
                m.setNomefilme(rs.getString("nomefilme"));
                m.setLancamento(rs.getString("lancamento"));
                m.setDirecao(rs.getString("direcao"));
                m.setPais(rs.getString("pais"));
                m.setUrlcartaz(rs.getString("urlcartaz"));
                m.setVotosfilme(rs.getDouble("votosfilme"));
                m.setVotantesfilme(rs.getDouble("votantesfilme"));
                m.setMediafilme(rs.getDouble("mediafilme"));
                movies.add(m);
            }
            rs.close();
            ps.close();
            ConexaoBD.fechar(bd);
        } catch(SQLException sqle){
            System.out.println("Erro nos 10 ultimos filmes: "+sqle.getMessage());
        }
        return movies;
    }
    
    public List<Filme> melhorMediaFilme(){ /*Metodo especial que pega os 10 filmes com maior media*/
        List<Filme> movies = new ArrayList<Filme>();
        try{
            PreparedStatement ps = bd.prepareStatement("SELECT * FROM filmes ORDER BY mediafilme DESC FETCH FIRST 10 ROWS ONLY");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Filme m = new Filme();
                m.setIdfilme(rs.getInt("idfilme"));
                m.setNomefilme(rs.getString("nomefilme"));
                m.setLancamento(rs.getString("lancamento"));
                m.setDirecao(rs.getString("direcao"));
                m.setPais(rs.getString("pais"));
                m.setUrlcartaz(rs.getString("urlcartaz"));
                m.setVotosfilme(rs.getDouble("votosfilme"));
                m.setVotantesfilme(rs.getDouble("votantesfilme"));
                m.setMediafilme(rs.getDouble("mediafilme"));
                movies.add(m);
            }
            rs.close();
            ps.close();
            ConexaoBD.fechar(bd);
        } catch(SQLException sqle){
            System.out.println("Erro nas 10 melhores medias: "+sqle.getMessage());
        }
        return movies;
    }
}
