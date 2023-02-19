package com.psicodramma.model;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
@Entity
@Table(name = "commento")
public class Commento extends Interagibile{
    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name = "id_utente")
    private Utente utente;
    private String testo;
    private LocalDateTime timestamp;
    @Transient private Interagibile interagibile;

    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public Utente getUtente() {
        return utente;
    }
    public void setUtente(Utente utente) {
        this.utente = utente;
    }
    public String getTesto() {
        return testo;
    }
    public void setTesto(String testo) {
        this.testo = testo;
    }
    public LocalDateTime getTimestamp() {
        return timestamp;
    }
    public void setTimestamp(LocalDateTime timestamp) {
        this.timestamp = timestamp;
    }
    public Interagibile getInteragibile() {
        return interagibile;
    }
    public void setInteragibile(Interagibile interagibile) {
        this.interagibile = interagibile;
    } 
    
}
