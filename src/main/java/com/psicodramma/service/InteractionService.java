package com.psicodramma.service;
import java.util.Date;
import java.util.Set;

import com.psicodramma.dao.InteragibileDao;
import com.psicodramma.model.Commento;
import com.psicodramma.model.Interagibile;
import com.psicodramma.model.Utente;

public class InteractionService {
    // private EntityManagerFactory emf = Persistence.createEntityManagerFactory("default"); 
    private InteragibileDao interagibileDao = new InteragibileDao();

    public Set<Commento> getComment(Interagibile riferimento){
       Set<Commento> commenti =  interagibileDao.getCommentiSet(riferimento);
       return commenti;
    }

    public Set<String> getLikes(Interagibile riferimento){
        Set<String> commenti =  interagibileDao.getLikeSet(riferimento);
        return commenti;
     }

    public void addLike(Interagibile riferimento, Utente user){
        interagibileDao.addLike(riferimento, user);
        riferimento.getLike().add(user.getUsername());
    }

    public void removeLike(Interagibile riferimento, Utente user){
        interagibileDao.removeLike(riferimento, user);
        riferimento.getLike().remove(user.getUsername());
    }

    public Commento addComment(Interagibile riferimento, Utente user, String testo){
        Commento c = new Commento(user, testo, new Date(), riferimento);
        riferimento.getCommenti().add(c);
        interagibileDao.addComment(c);
        return c;
    }
}
