package com.psicodramma.dao;

import java.util.Collection;
import java.util.List;
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

    public Set<String> getAutoriByOpera(int id){
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

    public Set<String> getGeneriByOpera(int id){
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

    public Opera getOperaById(int id) {
        EntityManager em=emf.createEntityManager();
        Opera op = em.find(Opera.class, id);
        em.close();
        if(!Objects.isNull(op)){
            op.setAutori(getAutoriByOpera(id));
            op.setGeneri(getGeneriByOpera(id));
        }
        return op;
    }

    public Collection<Opera> getOpereByTitolo(String titolo){
        EntityManager em=emf.createEntityManager();
        @SuppressWarnings("unchecked")
        Collection<Opera> opere = 
            em.createNativeQuery(
                "Select * from opere_preferite where unaccent(LOWER(titolo)) like unaccent(LOWER(?1))", Opera.class)
            .setParameter(1, "%".concat(titolo.concat("%")))
            .getResultList();
        em.close();
        return opere;
    }

    public Collection<Opera> getOpereByGenere(String genere){
        EntityManager em=emf.createEntityManager();
        @SuppressWarnings("unchecked")
        Collection<Opera> opere = 
            em.createNativeQuery("Select o.* from opere_preferite o join genere_opera go on o.id = go.id_opera join genere g on go.id_genere = g.id where LOWER(g.nome) like LOWER(?1)", Opera.class)
            .setParameter(1, genere.concat("%"))
            .getResultList();
        em.close();
        return opere;
    }

    public Collection<Opera> getOpereByAutore(String autore){
        EntityManager em=emf.createEntityManager();
        // concat_ws(?1, nome, cognome)
        String sql = "Select o.* from opere_preferite o join autore_opera ao on o.id = ao.id_opera join autore a on ao.id_autore = a.id where unaccent(LOWER(concat_ws(?1, nome, cognome))) like unaccent(LOWER(?2))";
        @SuppressWarnings("unchecked")
        Collection<Opera> opere = 
            em.createNativeQuery(sql, Opera.class)
            .setParameter(1, " ")
            .setParameter(2, "%".concat(autore.concat("%")))
            .getResultList();
        em.close();
        return opere;
    }




}
