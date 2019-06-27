package Modelo;
/*Criação da classe ator bem padrão, com metodos get e set*/
public class Ator {
    private int idator;
    private String nomeator;
    private String conjuge;
    private String nacionalidade;
    private String nascimento;
    private String urlretrato;
    private double votosator;
    private double votantesator;
    private double mediaator;

    public Ator() {
    }

    public Ator(String nomeator, String conjuge, String nacionalidade, String nascimento, String urlretrato, int votosator, int votantesator, double mediaator) {
        this.nomeator = nomeator;
        this.conjuge = conjuge;
        this.nacionalidade = nacionalidade;
        this.nascimento = nascimento;
        this.urlretrato = urlretrato;
        this.votosator = votosator;
        this.votantesator = votantesator;
        this.mediaator = mediaator;
    }

    public int getIdator() {
        return idator;
    }

    public void setIdator(int idator) {
        this.idator = idator;
    }

    public String getNomeator() {
        return nomeator;
    }

    public void setNomeator(String nomeator) {
        this.nomeator = nomeator;
    }

    public String getConjuge() {
        return conjuge;
    }

    public void setConjuge(String conjuge) {
        this.conjuge = conjuge;
    }

    public String getNacionalidade() {
        return nacionalidade;
    }

    public void setNacionalidade(String nacionalidade) {
        this.nacionalidade = nacionalidade;
    }

    public String getNascimento() {
        return nascimento;
    }

    public void setNascimento(String nascimento) {
        this.nascimento = nascimento;
    }

    public String getUrlretrato() {
        return urlretrato;
    }

    public void setUrlretrato(String urlretrato) {
        this.urlretrato = urlretrato;
    }

    public double getVotosator() {
        return votosator;
    }

    public void setVotosator(double votosator) {
        this.votosator = votosator;
    }

    public double getVotantesator() {
        return votantesator;
    }

    public void setVotantesator(double votantesator) {
        this.votantesator = votantesator;
    }

    public double getMediaator() {
        return mediaator;
    }

    public void setMediaator(double mediaator) {
        this.mediaator = mediaator;
    }
}