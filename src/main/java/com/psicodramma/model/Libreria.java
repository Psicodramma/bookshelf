package com.psicodramma.model;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Embeddable;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Transient;
@Embeddable
public class Libreria {

    @OneToMany(
        mappedBy = "proprietario",
        cascade = CascadeType.ALL,
        orphanRemoval = true
    )
    private List<Raccolta> raccoltePersonali;

    @Transient
    private Utente proprietario;

    public Libreria(){
        raccoltePersonali = new ArrayList<>();
    }
    public List<Raccolta> getRaccoltePersonali() {
        return raccoltePersonali;
    }
    public void setRaccoltePersonali(List<Raccolta> raccoltePersonali) {
        this.raccoltePersonali = raccoltePersonali;
    }
    public Utente getProprietario() {
        return proprietario;
    }
    public void setProprietario(Utente proprietario) {
        this.proprietario = proprietario;
    }

    public void addRaccolta(Raccolta r){
        raccoltePersonali.add(r);
    }
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
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
        Libreria other = (Libreria) obj;
        if (proprietario == null) {
            if (other.proprietario != null)
                return false;
        } else if (!proprietario.equals(other.proprietario))
            return false;
        return true;
    }

    
}
