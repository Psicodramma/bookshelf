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
        Collection<Opera> oc = od.getOpereByAutore(text);
        oc.forEach(x -> {
            x.setAutori(od.getAutoriByOpera(x.getId()));
            x.setGeneri(od.getGeneriByOpera(x.getId()));
        });
        return oc;
    }
}
