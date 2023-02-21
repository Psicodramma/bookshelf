package com.psicodramma.dao;

import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import com.psicodramma.model.Commento;
import com.psicodramma.model.Interagibile;
import com.psicodramma.model.Utente;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceException;

public class InteragibileDao{
    private EntityManagerFactory emf;

    public InteragibileDao(){
        emf = Persistence.createEntityManagerFactory("default");
    }

    private String getSimpleClassName(Object o){
        return o.getClass().getSimpleName().toLowerCase();
    }

    public void setInteragibile(Interagibile riferimento){
        riferimento.setCommenti(getCommentiSet(riferimento));
        riferimento.setLike(getLikeSet(riferimento));
    }
    
    public Set<Commento> getCommentiSet(Interagibile riferimento){
        EntityManager em=emf.createEntityManager();
        @SuppressWarnings("unchecked")
        Stream<Commento> commStream = 
            em.createNativeQuery(
                "Select * from commento where id_riferimento = ?1 and tipo_riferimento = ?2", Commento.class)
            .setParameter(1, riferimento.getId())
            .setParameter(2, getSimpleClassName(riferimento))
            .getResultStream();
        Set<Commento> comm = commStream.collect(Collectors.toSet());
        em.close();
        comm.forEach(x -> {
            setInteragibile(x);
            x.setInteragibile(riferimento);
        });
        return comm;
    }

    public Set<String> getLikeSet(Interagibile riferimento){
        EntityManager em=emf.createEntityManager();
        @SuppressWarnings("unchecked")
        Stream<String> likeStream = 
            em.createNativeQuery(
                "Select id_utente from mi_piace where id_riferimento = ?1 and tipo_riferimento = ?2")
            .setParameter(1, riferimento.getId())
            .setParameter(2, getSimpleClassName(riferimento))
            .getResultStream();
        Set<String> like = likeStream.collect(Collectors.toSet());
        em.close();
        return like;
    }

    public void addLike(Interagibile riferimento, Utente user) {
        EntityManager em=emf.createEntityManager();
        String query = "INSERT INTO mi_piace(id_riferimento, tipo_riferimento, id_utente) VALUES (?1, ?2, ?3)";
        try{   
            em.getTransaction().begin(); 
            em.createNativeQuery(query)
                .setParameter(1, riferimento.getId())
                .setParameter(2, getSimpleClassName(riferimento))
                .setParameter(3, user.getUsername())
                .executeUpdate();
            em.getTransaction().commit();
            em.close();
        }catch(PersistenceException e){
            e.printStackTrace();
        }
    }

    public void removeLike(Interagibile riferimento, Utente user) {
        EntityManager em=emf.createEntityManager();
        String query = "DELETE FROM public.mi_piace WHERE id_riferimento = ?1 AND tipo_riferimento = ?2 AND id_utente = ?3";
        try{   
            em.getTransaction().begin(); 
            em.createNativeQuery(query)
                .setParameter(1, riferimento.getId())
                .setParameter(2, getSimpleClassName(riferimento))
                .setParameter(3, user.getUsername())
                .executeUpdate();
        
            em.getTransaction().commit();
            em.close();
        }catch(PersistenceException e){
            e.printStackTrace();
        }
    }

    public void addComment(Commento c){
        EntityManager em=emf.createEntityManager();
        Interagibile riferimento = c.getInteragibile();
        String query = "INSERT INTO commento(testo, timestamp, id_riferimento, tipo_riferimento, id_utente) VALUES (?1, ?2, ?3, ?4, ?5)";
        try{   
            em.getTransaction().begin(); 
            em.createNativeQuery(query)
                .setParameter(1, c.getTesto())
                .setParameter(2, c.getTimestamp())
                .setParameter(3, riferimento.getId())
                .setParameter(4, getSimpleClassName(riferimento))
                .setParameter(5, c.getUtente().getUsername())
                .executeUpdate();
            em.getTransaction().commit();
            em.close();
        }catch(PersistenceException e){
            e.printStackTrace();
        }
    }
}   
