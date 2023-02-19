package com.psicodramma.service;

import java.util.List;

import com.psicodramma.model.Azione;
import com.psicodramma.model.Utente;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceException;

public class TimelineService {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("default"); 

    public List<Azione> getActionList(Utente u){
        List<Azione> res = null; 
        EntityManager em = emf.createEntityManager();
        res = em.createNativeQuery("select a.* from azione a", Azione.class).getResultList();

        return res;
    }
}
