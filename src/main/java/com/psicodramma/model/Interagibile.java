package com.psicodramma.model;

import java.util.Set;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.Transient;

@MappedSuperclass
public abstract class Interagibile {
    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Transient protected Set<String> like;
    @Transient protected Set<Commento> commenti;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public Set<String> getLike() {
        return like;
    }
    public void setLike(Set<String> like) {
        this.like = like;
    }
    public Set<Commento> getCommenti() {
        return commenti;
    }
    public void setCommenti(Set<Commento> commenti) {
        this.commenti = commenti;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + String.valueOf(getId()).hashCode();
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
        if (getId() != (getClass().cast(obj)).getId())
            return false;
        return true;
    }

    
}
