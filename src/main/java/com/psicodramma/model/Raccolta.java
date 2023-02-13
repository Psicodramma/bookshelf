package com.psicodramma.model;

import java.util.Set;

public class Raccolta {
    private String nome;
    private String descrizione;
    private Set<Edizione> edizioni;
    private Libreria libreria;
    
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
    public Set<Edizione> getEdizioni() {
        return edizioni;
    }
    public void setEdizioni(Set<Edizione> edizioni) {
        this.edizioni = edizioni;
    }
    public Libreria getLibreria() {
        return libreria;
    }
    public void setLibreria(Libreria libreria) {
        this.libreria = libreria;
    }
    
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((nome == null) ? 0 : nome.hashCode());
        result = prime * result + ((libreria == null) ? 0 : libreria.hashCode());
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
        if (libreria == null) {
            if (other.libreria != null)
                return false;
        } else if (!libreria.equals(other.libreria))
            return false;
        return true;
    }
    
    
}
