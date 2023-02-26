package com.psicodramma.service;
import java.util.Date;
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

    public void addFollow(Utente me, Utente utente) {
        EntityManager em = emf.createEntityManager();
        me.addAmico(utente);
        em.getTransaction().begin();
        em.merge(me);
        em.getTransaction().commit();
        em.close();
    }

    public void removeFollow(Utente me, Utente utente) {
        EntityManager em = emf.createEntityManager();
        me.removeAmico(utente);
        em.getTransaction().begin();
        em.merge(me);
        em.getTransaction().commit();
        em.close();
    }
}
