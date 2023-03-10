package com.psicodramma.model;

import java.util.Set;
import jakarta.persistence.*;

@Entity
@Table(name="utente")
public class Utente {
    @Id
    private String username;
    @Basic(fetch = FetchType.LAZY)
    private String password;
    @Basic(fetch = FetchType.LAZY)
    private String nazionalita;
    @Embedded
    private Libreria libreria;
    @ManyToMany
    @JoinTable(name = "segue",
        joinColumns = { @JoinColumn(name = "seguace", nullable = false)},
        inverseJoinColumns = { @JoinColumn(name = "seguito", nullable = false)})
    private Set<Utente> amici;

    public Utente(){
        libreria = new Libreria();
    }

    public Utente(String username) {
        this.username = username;
        libreria = new Libreria();
    }

    public Utente(String username, String nazionalita, String password) {
        this.username = username;
        this.nazionalita = nazionalita;
        this.password = password;
        libreria = new Libreria();
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
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
    public boolean addAmico(Utente utente) {
        return amici.add(utente);
    }
    public boolean removeAmico(Utente utente) {
        return amici.remove(utente);
    }
    public boolean isAmico(Utente utente) {
        return amici.contains(utente);
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
