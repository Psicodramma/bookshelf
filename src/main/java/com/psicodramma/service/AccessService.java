package com.psicodramma.service;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Set;
import java.util.stream.Collectors;

import com.psicodramma.model.Libreria;
import com.psicodramma.model.Raccolta;
import com.psicodramma.model.Utente;
import com.psicodramma.model.enums.TipoAzione;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceException;

public class AccessService {

    private EntityManagerFactory emf; 
    
    public AccessService(){
        emf = Persistence.createEntityManagerFactory("default");
    }

    public AccessService(String persistenceUnit){
        emf = Persistence.createEntityManagerFactory(persistenceUnit);
    }

    public Utente getUser(String username) throws PersistenceException{
        EntityManager em=emf.createEntityManager(); 
        Utente u;
        u = em.getReference(Utente.class, username);
        em.close();
        return u;
    }

    public boolean login(String username, String password){
        EntityManager em=emf.createEntityManager(); 
        long num = (long) em.createNativeQuery("select count(*) from utente where username = ?1 and password = ?2")
                            .setParameter(1, username)
                            .setParameter(2, password)
                            .getSingleResult();
        em.close();
        return num >= 1;
    }

    public boolean register(String username, String password, String nationality){
        boolean success = true;
        EntityManager em=emf.createEntityManager(); 
        Utente u = new Utente(username, nationality, password);
        u.setLibreria(new Libreria());
        Libreria l = u.getLibreria();
        l.setProprietario(u);
        for(int i=0; i<TipoAzione.values().length; i++){
            l.addRaccolta(new Raccolta(TipoAzione.values()[i].toString(), u));
        }
        
        try{   
            em.getTransaction().begin(); 
            em.persist(u);
            em.getTransaction().commit();
            em.close();
        }catch(PersistenceException e){
            success = false;
        }

        return success;
    }

    public String restorePassword(String username){
        String pwd = "";
        EntityManager em=emf.createEntityManager(); 

        try{    
            pwd = (String) em.createNativeQuery("select password from utente where username = ?1")
                                    .setParameter(1, username)
                                    .getSingleResult();
                                
            em.close(); 
        } catch(NoResultException e){ }

        return pwd;
    }
}
