package Modelo;
import java.sql.Timestamp;
/*Criação da classe bem padrão, com metodos get e set e a inclusão de um timestamp
para controlar a data de acesso. Há também uma booleano para validação do login*/
public class Usuario {
    private int id;
    private String usuario;
    private String nome;
    private String email;
    private String senha;
    private String pin;
    private String urlfoto;
    private Timestamp acesso;
    private int admin;
    private boolean valid;

    public Usuario() {
    }
    
    public Usuario(String usuario, String nome, String email, String senha, String pin, String urlfoto, Timestamp acesso, int admin) {
        this.usuario = usuario;
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.pin = pin;
        this.urlfoto = urlfoto;
        this.acesso = acesso;
        this.admin = admin;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getPin() {
        return pin;
    }

    public void setPin(String pin) {
        this.pin = pin;
    }

    public String getUrlfoto() {
        return urlfoto;
    }

    public void setUrlfoto(String urlfoto) {
        this.urlfoto = urlfoto;
    }

    public Timestamp getAcesso() {
        return acesso;
    }

    public void setAcesso(Timestamp acesso) {
        this.acesso = acesso;
    }

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }
    
    public boolean isValid(){
        return valid;
    }

    public void setValid(boolean valid){
        this.valid = valid;
    }
}