package com.psicodramma.model;

import java.util.Set;

public abstract class Interagibile {
    private Set<Utente> like;
    private Set<Commento> commenti;

    public Set<Utente> getLike() {
        return like;
    }
    public void setLike(Set<Utente> like) {
        this.like = like;
    }
    public Set<Commento> getCommenti() {
        return commenti;
    }
    public void setCommenti(Set<Commento> commenti) {
        this.commenti = commenti;
    }
}
