package com.psicodramma;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.ArrayList;
import java.util.Set;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.psicodramma.dao.OperaDao;
import com.psicodramma.model.Opera;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Persistence;

public class RicercaTest {
    private static OperaDao od;
    private static ArrayList<Opera> opere;


    @BeforeAll
    public static void initRicercaTest(){
        od = new OperaDao("test");
        opere = new ArrayList<>();
        EntityManager em = Persistence.createEntityManagerFactory("test").createEntityManager();

        em.getTransaction().begin();
        
        for(int i = 1; i<5; i++){
            em.createNativeQuery("Insert into autore (nome) values (?1)").setParameter(1, "a".concat(String.valueOf(i))).executeUpdate();
            em.createNativeQuery("Insert into genere (nome) values (?1)").setParameter(1, "g".concat(String.valueOf(i))).executeUpdate();
        }
           
        for(int i = 1; i<5; i++){
            opere.add(new Opera(i, "titolo".concat(String.valueOf(i)), "test", "test", Set.of(),Set.of(), i, Set.of()));
            em.createNativeQuery("Insert into opera (titolo) values (?1)").setParameter(1, "titolo".concat(String.valueOf(i))).executeUpdate();
        }
        em.createNativeQuery("Insert into autore_opera values (?1, ?2)").setParameter(1, 1).setParameter(2, 1).executeUpdate();
        em.createNativeQuery("Insert into genere_opera values (?1, ?2)").setParameter(1, 1).setParameter(2, 1).executeUpdate();
        em.createNativeQuery("Insert into autore_opera values (?1, ?2)").setParameter(1, 2).setParameter(2, 2).executeUpdate();
        em.createNativeQuery("Insert into genere_opera values (?1, ?2)").setParameter(1, 2).setParameter(2, 2).executeUpdate();
        em.createNativeQuery("Insert into autore_opera values (?1, ?2)").setParameter(1, 1).setParameter(2, 3).executeUpdate();
        em.createNativeQuery("Insert into genere_opera values (?1, ?2)").setParameter(1, 3).setParameter(2, 3).executeUpdate();
        em.createNativeQuery("Insert into autore_opera values (?1, ?2)").setParameter(1, 3).setParameter(2, 4).executeUpdate();
        em.createNativeQuery("Insert into genere_opera values (?1, ?2)").setParameter(1, 2).setParameter(2, 4).executeUpdate();

        em.getTransaction().commit();
        em.close();   
    }
    
    private <T> boolean setEquals(Set<T> set1, Set<T> set2){
        return set1.containsAll(set2) && set2.containsAll(set1);
    }

    @Test
    public void ricercaByTitolo(){
        Set<Opera> ex = Set.of(opere.get(1));
        Set<Opera> out = Set.copyOf(od.getOpereByAutore("2"));
        assertTrue(setEquals(ex, out));
        out = Set.copyOf(od.getOpereByTitolo("titolo5"));
        assertFalse(setEquals(ex, out));
    }

    @Test
    public void ricercaByAutore(){
        Set<Opera> ex = Set.of(opere.get(0), opere.get(2));
        Set<Opera> out = Set.copyOf(od.getOpereByAutore("a1"));
        assertTrue(setEquals(ex, out));
        out = Set.copyOf(od.getOpereByAutore("a4"));
        assertFalse(setEquals(ex, out));
    }

    @Test
    public void ricercaByGenere(){
        Set<Opera> ex = Set.copyOf(opere);
        Set<Opera> out = Set.copyOf(od.getOpereByGenere("g"));
        assertTrue(setEquals(ex, out));
        out = Set.copyOf(od.getOpereByGenere("g4"));
        assertFalse(setEquals(ex, out));
    }

    @AfterAll
    public static void deleteAll(){
        EntityManager em = Persistence.createEntityManagerFactory("test").createEntityManager();
        em.getTransaction().begin();
        em.createNativeQuery("Truncate autore, autore_opera, genere, genere_opera, opera restart IDENTITY cascade").executeUpdate();
        em.getTransaction().commit();
        em.close();
    }
}
