package com.psicodramma.model;

import java.util.Set;

public class Libreria {
    private Raccolta letti;
    private Raccolta daLeggere;
    private Raccolta inLettura;
    private Raccolta accantonati;
    private Set<Raccolta> raccoltePersonali;
    private Utente proprietario;

    public Raccolta getLetti() {
        return letti;
    }
    public void setLetti(Raccolta letti) {
        this.letti = letti;
    }
    public Raccolta getDaLeggere() {
        return daLeggere;
    }
    public void setDaLeggere(Raccolta daLeggere) {
        this.daLeggere = daLeggere;
    }
    public Raccolta getInLettura() {
        return inLettura;
    }
    public void setInLettura(Raccolta inLettura) {
        this.inLettura = inLettura;
    }
    public Raccolta getAccantonati() {
        return accantonati;
    }
    public void setAccantonati(Raccolta accantonati) {
        this.accantonati = accantonati;
    }
    public Set<Raccolta> getRaccoltePersonali() {
        return raccoltePersonali;
    }
    public void setRaccoltePersonali(Set<Raccolta> raccoltePersonali) {
        this.raccoltePersonali = raccoltePersonali;
    }
    public Utente getProprietario() {
        return proprietario;
    }
    public void setProprietario(Utente proprietario) {
        this.proprietario = proprietario;
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
