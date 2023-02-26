package com.psicodramma.dao;

import com.psicodramma.model.Raccolta;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class RaccoltaDao {
    private EntityManagerFactory emf;

    public RaccoltaDao(String persistenceUnit){
        emf = Persistence.createEntityManagerFactory(persistenceUnit);
    }

    public void update(Raccolta raccolta){
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.merge(raccolta);
        em.getTransaction().commit();
        em.close();
    }

    public void remove(Raccolta raccolta){
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.remove(em.merge(raccolta));
        em.getTransaction().commit();
        em.close();
    }

    public void insert(Raccolta raccolta){
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(raccolta);;
        em.getTransaction().commit();
        em.close();
    }
}
