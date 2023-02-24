package com.psicodramma;

import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.Set;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.psicodramma.dao.OperaDao;
import com.psicodramma.model.Autore;
import com.psicodramma.model.Genere;
import com.psicodramma.model.Opera;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Persistence;

public class OperaDaoTest {

    private static OperaDao od;
    private static Opera test;
    private static Set<Autore> autori;
    private static Set<Genere> generi;
    @BeforeAll
    public static void initOperaDao(){
        od = new OperaDao("test");
        autori = Set.of(new Autore("nome", "cognome"), new Autore("nome1", "cognome1"));
        generi = Set.of(new Genere("genere1"), new Genere("genere2"));
        test = new Opera(1, "test", "Opera di test", "test", autori, generi, 0, null);
        EntityManager em = Persistence.createEntityManagerFactory("test").createEntityManager();
        em.getTransaction().begin();
        em.persist(test);
        int i = 0;
        for (Autore autore : autori) {
            autore.setId(i);
            em.persist(autore);;
            //em.createNativeQuery("Insert into autore_opera values (?1, ?2)").setParameter(1, i).setParameter(2, 1).executeUpdate();
            i++;
        }
        i = 0;
        for (Genere genere : generi) {
            genere.setId(i);
            em.persist(genere);
            //em.createNativeQuery("Insert into genere_opera values (?1, ?2)").setParameter(1, i).setParameter(2, 1).executeUpdate();
            i++;
        }
        em.getTransaction().commit();
        em.close();
    }

    @Test
    public void getOperaTest(){
        Opera o = od.getOperaById(1);
        assertTrue(test.equals(o));
    }

    @Test
    public void getAutoriTest(){
        Set<Autore> autori =  od.getOperaById(1).getAutori();
        Set<Autore> autoriTest = test.getAutori();
        assertTrue(autoriTest.containsAll(autori) && autori.containsAll(autoriTest));
    }

    @Test
    public void getGeneriTest(){
        Set<Genere> generi = od.getOperaById(1).getGeneri();
        Set<Genere> generiTest = test.getGeneri();
        assertTrue(generiTest.containsAll(generi) && generi.containsAll(generiTest));
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
