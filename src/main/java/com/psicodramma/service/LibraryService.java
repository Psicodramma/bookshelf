package com.psicodramma.service;

import com.psicodramma.model.Utente;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class LibraryService {

    private EntityManagerFactory emf; 

    public LibraryService(){
        emf = Persistence.createEntityManagerFactory("default");
    }

    public LibraryService(String persistenceUnit){
        emf = Persistence.createEntityManagerFactory(persistenceUnit);
    }

}
