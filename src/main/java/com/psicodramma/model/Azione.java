package com.psicodramma.model;

import java.time.LocalDateTime;
import java.util.Date;

import com.psicodramma.model.enums.TipoAzione;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name = "azione")
public class Azione extends Interagibile{
    @Id
    private String id;
    
    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name = "id_edizione")
    private Edizione edizione;

    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name = "id_utente")
    private Utente utente;
    
    @Enumerated(EnumType.STRING)
    private TipoAzione tipo;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date timestamp;

    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public Edizione getEdizione() {
        return edizione;
    }
    public void setEdizione(Edizione edizione) {
        this.edizione = edizione;
    }
    public Utente getUtente() {
        return utente;
    }
    public void setUtente(Utente utente) {
        this.utente = utente;
    }
    public TipoAzione getAzione() {
        return tipo;
    }
    public void setAzione(TipoAzione tipo) {
        this.tipo = tipo;
    }
    public Date getTimestamp() {
        return timestamp;
    }
    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }
}
