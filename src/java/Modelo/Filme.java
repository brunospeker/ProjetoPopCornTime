package Modelo;
/*Criação da classe filme bem padrão, com metodos get e set*/
public class Filme {
    private int idfilme;
    private String nomefilme;
    private String lancamento;
    private String direcao;
    private String pais;
    private String urlcartaz;
    private double votosfilme;
    private double votantesfilme;
    private double mediafilme;

    public Filme() {
    }

    public Filme(String nomefilme, String lancamento, String direcao, String pais, String urlcartaz, int votosfilme, int votantesfilme, double mediafilme) {
        this.nomefilme = nomefilme;
        this.lancamento = lancamento;
        this.direcao = direcao;
        this.pais = pais;
        this.urlcartaz = urlcartaz;
        this.votosfilme = votosfilme;
        this.votantesfilme = votantesfilme;
        this.mediafilme = mediafilme;
    }

    public int getIdfilme() {
        return idfilme;
    }

    public void setIdfilme(int idfilme) {
        this.idfilme = idfilme;
    }

    public String getNomefilme() {
        return nomefilme;
    }

    public void setNomefilme(String nomefilme) {
        this.nomefilme = nomefilme;
    }

    public String getLancamento() {
        return lancamento;
    }

    public void setLancamento(String lancamento) {
        this.lancamento = lancamento;
    }

    public String getDirecao() {
        return direcao;
    }

    public void setDirecao(String direcao) {
        this.direcao = direcao;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public String getUrlcartaz() {
        return urlcartaz;
    }

    public void setUrlcartaz(String urlcartaz) {
        this.urlcartaz = urlcartaz;
    }

    public double getVotosfilme() {
        return votosfilme;
    }

    public void setVotosfilme(double votosfilme) {
        this.votosfilme = votosfilme;
    }

    public double getVotantesfilme() {
        return votantesfilme;
    }

    public void setVotantesfilme(double votantesfilme) {
        this.votantesfilme = votantesfilme;
    }

    public double getMediafilme() {
        return mediafilme;
    }

    public void setMediafilme(double mediafilme) {
        this.mediafilme = mediafilme;
    }
}