package com.psicodramma.model;

import java.sql.Date;

import jakarta.persistence.*;

@Entity
public class Edizione extends Interagibile{
    @Column(name="data_pubblicazione")
    private Date dataPubblicazione;
    @Column(name="numero_pagine")
    private int numeroPagine;
    private String isbn;
    private String editore;
    private String lingua;
    @Column(name="paese_pubblicazione")
    private String paese;
    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name = "id_opera")
    private Opera opera;

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