package com.psicodramma.service;

import java.util.ArrayList;
import java.util.Collection;

import com.psicodramma.dao.OperaDao;
import com.psicodramma.model.Opera;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class BookService {
    private EntityManagerFactory emf; 
    private OperaDao od;
    
    public BookService(){
        emf = Persistence.createEntityManagerFactory("default");
        od = new OperaDao();
    }

    public Collection<Opera> search(String text) {
        return od.getOpereByTitolo(text);
    }
}
