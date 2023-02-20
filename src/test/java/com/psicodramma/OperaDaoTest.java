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
    public static void initAccessService(){
        od = new OperaDao("test");
        autori = Set.of("autore test", "test test");
        generi = Set.of("romanzo", "test");
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
    public static void deleteUser(){
        EntityManager em = Persistence.createEntityManagerFactory("test").createEntityManager();
        em.getTransaction().begin();
        em.createNativeQuery("Delete from autore_opera").executeUpdate();
        em.createNativeQuery("Delete from genere_opera").executeUpdate();
        em.createNativeQuery("Delete from genere").executeUpdate();
        em.createNativeQuery("Delete from opera").executeUpdate();
        em.createNativeQuery("Delete from autore").executeUpdate();
        em.getTransaction().commit();
        em.close();
    }

}
