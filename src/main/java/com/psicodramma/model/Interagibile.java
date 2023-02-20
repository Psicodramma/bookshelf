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
    @GeneratedValue(strategy = GenerationType.AUTO)
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
}
