package com.psicodramma.model;

import java.util.Set;

public class Utente {
    private String username;
    private String nazionalita;
    private Libreria libreria;
    private Set<Utente> amici;

    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getNazionalita() {
        return nazionalita;
    }
    public void setNazionalita(String nazionalita) {
        this.nazionalita = nazionalita;
    }
    public Libreria getLibreria() {
        return libreria;
    }
    public void setLibreria(Libreria libreria) {
        this.libreria = libreria;
    }
    public Set<Utente> getAmici() {
        return amici;
    }
    public void setAmici(Set<Utente> amici) {
        this.amici = amici;
    }
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((username == null) ? 0 : username.hashCode());
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
        Utente other = (Utente) obj;
        if (username == null) {
            if (other.username != null)
                return false;
        } else if (!username.equals(other.username))
            return false;
        return true;
    }

    
}
