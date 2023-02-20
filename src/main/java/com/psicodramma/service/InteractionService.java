package com.psicodramma.service;

import java.util.Set;

import com.psicodramma.dao.InteragibileDao;
import com.psicodramma.model.Commento;
import com.psicodramma.model.Interagibile;
import com.psicodramma.model.Utente;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class InteractionService {
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("default"); 
    private InteragibileDao interagibileDao = new InteragibileDao();

    public void addComment(Interagibile inter, Utente user, String commento){
        
    }

    public Set<Commento> getComment(Interagibile interagibile){
       Set<Commento> commenti =  interagibileDao.getCommentiSet(interagibile);
       return commenti;
    }

    public Set<String> getLikes(Interagibile interagibile){
        Set<String> commenti =  interagibileDao.getLikeSet(interagibile);
        return commenti;
     }

    public void addLike(Interagibile inter, Utente user){
        interagibileDao.addLike(inter, user);
        inter.getLike().add(user.getUsername());
    }

    public void removeLike(Interagibile inter, Utente user){
        interagibileDao.removeLike(inter, user);
        inter.getLike().remove(user.getUsername());
    }
}
