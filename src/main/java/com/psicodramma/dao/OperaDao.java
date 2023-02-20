package com.psicodramma.dao;

import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import com.psicodramma.model.Opera;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class OperaDao{

    private EntityManagerFactory emf;

    public OperaDao(){
        emf = Persistence.createEntityManagerFactory("default");
    };

    public OperaDao(String persistenceUnit){
        emf = Persistence.createEntityManagerFactory(persistenceUnit);
    }

    public Set<String> getAutoriByOpera(String id){
        EntityManager em=emf.createEntityManager();
        @SuppressWarnings("unchecked")
        Stream<String> autStream = 
            em.createNativeQuery(
                "Select concat_ws(?1, nome, cognome) from autore a join autore_opera ao on a.id = ao.id_autore where id_opera = ?2")
            .setParameter(1, ' ')
            .setParameter(2, id)
            .getResultStream();
        Set<String> aut = autStream.collect(Collectors.toSet());
        em.close();
        return aut;
    }

    public Set<String> getGeneriByOpera(String id){
        EntityManager em=emf.createEntityManager();
        @SuppressWarnings("unchecked")
        Stream<String> genStream = 
            em.createNativeQuery(
                "Select nome from genere join genere_opera on id = id_genere where id_opera = ?1")
            .setParameter(1, id)
            .getResultStream();
        Set<String> gen = genStream.collect(Collectors.toSet());
        em.close();
        return gen;
    }

    public Opera getOperaById(String id) {
        EntityManager em=emf.createEntityManager();
        Opera op = em.find(Opera.class, id);
        em.close();
        if(!Objects.isNull(op)){
            op.setAutori(getAutoriByOpera(id));
            op.setGeneri(getGeneriByOpera(id));
        }
        return op;
    }
}
