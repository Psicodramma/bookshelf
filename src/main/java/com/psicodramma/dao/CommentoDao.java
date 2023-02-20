package com.psicodramma.dao;

import com.psicodramma.model.Commento;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceException;

public class CommentoDao {
    private EntityManagerFactory emf;

    public CommentoDao(){
        emf = Persistence.createEntityManagerFactory("default");
    }

    public void insertCommento(Commento c){
        //CERCANDO DI FAR AGGIUNGERE ANCHE ID E TIPO RIFERIMENTO MA IGNORA COMPLETAMENTE I GET
        EntityManager em=emf.createEntityManager();
        try{   
            em.getTransaction().begin(); 
            em.persist(c);
            em.getTransaction().commit();
            em.close();
        }catch(PersistenceException e){
            System.out.println("Errore");
        }
    }
}
