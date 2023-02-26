package com.psicodramma.service;

import java.util.Collection;
import java.util.function.BiFunction;

import com.psicodramma.dao.OperaDao;
import com.psicodramma.model.Opera;

public class BookService { 
    private OperaDao od;
    
    public BookService(){
        od = new OperaDao();
    }

    public Collection<Opera> search(BiFunction<OperaDao, String, Collection<Opera>> searchStrategy, String testo) {
        
        Collection<Opera> oc = searchStrategy.apply(od, testo);
        //oc.forEach(x -> {
        //    x.setAutori(od.getAutoriByOpera(x.getId()));
        //    x.setGeneri(od.getGeneriByOpera(x.getId()));
        //});
        return oc;
    }
}
