package com.psicodramma;

import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.Set;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.psicodramma.dao.OperaDao;
import com.psicodramma.model.Opera;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Persistence;

public class OperaDaoTest {

    private static OperaDao od;
    private static Opera test;
    private static Set<String> autori, generi;
    @BeforeAll
    public static void initOperaDao(){
        od = new OperaDao("test");
        autori = Set.of("nome cognome", "nome1 cognome1");
        generi = Set.of("genere1", "genere2");
        test = new Opera(1, "test", "Opera di test", "test", autori, generi, 0, null);
        EntityManager em = Persistence.createEntityManagerFactory("test").createEntityManager();
        em.getTransaction().begin();
        em.persist(test);
        int i = 0;
        for (String autore : autori) {
            em.createNativeQuery("Insert into autore values (?1, ?2, ?3)").setParameter(1, i).setParameter(2, autore.split(" ")[0]).setParameter(3, autore.split(" ")[1]).executeUpdate();
            em.createNativeQuery("Insert into autore_opera values (?1, ?2)").setParameter(1, i).setParameter(2, 1).executeUpdate();
            i++;
        }
        i = 0;
        for (String genere : generi) {
            em.createNativeQuery("Insert into genere values (?1, ?2)").setParameter(1, i).setParameter(2, genere).executeUpdate();
            em.createNativeQuery("Insert into genere_opera values (?1, ?2)").setParameter(1, i).setParameter(2, 1).executeUpdate();
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
        Set<String> autori = od.getAutoriByOpera(1);
        Set<String> autoriTest = test.getAutori();
        assertTrue(autoriTest.containsAll(autori) && autori.containsAll(autoriTest));
    }

    @Test
    public void getGeneriTest(){
        Set<String> generi = od.getGeneriByOpera(1);
        Set<String> generiTest = test.getGeneri();
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
