package com.psicodramma.model;

public class Edizione extends Interagibile{
    private int id;
    private int dataPubblicazione;
    private int numeroPagine;
    private String isbn;
    private String editore;
    private String lingua;
    private String paese;
    private Opera opera;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getDataPubblicazione() {
        return dataPubblicazione;
    }
    public void setDataPubblicazione(int dataPubblicazione) {
        this.dataPubblicazione = dataPubblicazione;
    }
    public int getNumeroPagine() {
        return numeroPagine;
    }
    public void setNumeroPagine(int numeroPagine) {
        this.numeroPagine = numeroPagine;
    }
    public String getIsbn() {
        return isbn;
    }
    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }
    public String getEditore() {
        return editore;
    }
    public void setEditore(String editore) {
        this.editore = editore;
    }
    public String getLingua() {
        return lingua;
    }
    public void setLingua(String lingua) {
        this.lingua = lingua;
    }
    public String getPaese() {
        return paese;
    }
    public void setPaese(String paese) {
        this.paese = paese;
    }
    public Opera getOpera() {
        return opera;
    }
    public void setOpera(Opera opera) {
        this.opera = opera;
    }    
}