package com.psicodramma.model;

import java.sql.Date;

import jakarta.persistence.*;

@Entity
public class Edizione extends Interagibile{
    @Id private int id;
    
    @Column(name="data_pubblicazione")
    private Date dataPubblicazione;
    @Column(name="numero_pagine")
    private int numeroPagine;
    private String isbn;
    private String editore;
    private String lingua;
    @Column(name="paese_pubblicazione")
    private String paese;
    @Transient
    private Opera opera;

    public Edizione() {
    }

    public Edizione(int id, Date dataPubblicazione, int numeroPagine, String isbn, String editore, String lingua,
            String paese, Opera opera) {
        this.id = id;
        this.dataPubblicazione = dataPubblicazione;
        this.numeroPagine = numeroPagine;
        this.isbn = isbn;
        this.editore = editore;
        this.lingua = lingua;
        this.paese = paese;
        this.opera = opera;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public Date getDataPubblicazione() {
        return dataPubblicazione;
    }
    public void setDataPubblicazione(Date dataPubblicazione) {
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