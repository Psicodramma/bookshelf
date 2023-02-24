package com.psicodramma.model;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Table
@Entity(name = "raccolta")
public class Raccolta {
    @Id
    private String nome;
    
    private String descrizione;

    @Id
    @ManyToOne
    @JoinColumn(name = "id_utente")
    private Utente proprietario;

    public Raccolta(){

    }

    public Raccolta(String nome, String descrizione, Utente proprietario) {
        this.nome = nome;
        this.descrizione = descrizione;
        this.proprietario = proprietario;
    }

    public Raccolta(String nome, Utente proprietario) {
        this.nome = nome;
        this.proprietario = proprietario;
    }

    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    public String getDescrizione() {
        return descrizione;
    }
    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }
    
    public Utente getProprietario(){
        return proprietario;
    }
    
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((nome == null) ? 0 : nome.hashCode());
        result = prime * result + ((proprietario == null) ? 0 : proprietario.hashCode());
        return result;
    }
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Raccolta other = (Raccolta) obj;
        if (nome == null) {
            if (other.nome != null)
                return false;
        } else if (!nome.equals(other.nome))
            return false;
        if (proprietario == null) {
            if (other.proprietario != null)
                return false;
        } else if (!proprietario.equals(other.proprietario))
            return false;
        return true;
    }

    

    
    
}
