package com.psicodramma.dao;

import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import com.psicodramma.model.Commento;
import com.psicodramma.model.Interagibile;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

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
    
    private Set<Commento> getCommentiSet(Interagibile riferimento){
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

    private Set<String> getLikeSet(Interagibile riferimento){
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
}   
