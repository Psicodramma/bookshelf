package com.psicodramma.model;

import java.util.Set;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
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

    @ManyToMany
    @JoinTable(
        name = "edizione_raccolta", 
        joinColumns = {@JoinColumn(name = "nome_raccolta", referencedColumnName = "nome"), 
        @JoinColumn(name="id_utente", referencedColumnName = "id_utente")}, 
        inverseJoinColumns = @JoinColumn(name = "id_edizione", referencedColumnName = "id"))
    private Set<Edizione> edizioni;

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
    
    public void setProprietario(Utente proprietario) {
        this.proprietario = proprietario;
    }

    public Set<Edizione> getEdizioni() {
        return edizioni;
    }

    public void setEdizioni(Set<Edizione> edizioni) {
        this.edizioni = edizioni;
    }

    public boolean addEdizione(Edizione e){
        return edizioni.add(e);
    }

    public boolean removeEdizione(Edizione e){
        return edizioni.remove(e);
    }

    public boolean contains(Edizione e){
        return edizioni.contains(e);
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

    @Override
    public String toString() {
        return nome;
    }
}
