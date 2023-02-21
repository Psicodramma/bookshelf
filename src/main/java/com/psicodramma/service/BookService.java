package com.psicodramma.service;

import java.util.ArrayList;
import java.util.Collection;

import com.psicodramma.model.Opera;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class BookService {
    private EntityManagerFactory emf; 
    
    public BookService(){
        emf = Persistence.createEntityManagerFactory("default");
    }

    public Collection<Opera> search(String text) {
        return new ArrayList<>();
    }
}
