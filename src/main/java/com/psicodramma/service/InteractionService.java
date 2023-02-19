package com.psicodramma.service;

import java.util.Set;

import com.psicodramma.model.Commento;
import com.psicodramma.model.Interagibile;
import com.psicodramma.model.Utente;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class InteractionService {
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("default"); 

    public void addComment(Interagibile inter, Utente user, String commento){
        
    }

    public void addLike(Interagibile inter, Utente user){

    }

    public void removeLike(Interagibile inter, Utente user){

    }
}
