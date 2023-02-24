package com.psicodramma;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.HashSet;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.psicodramma.model.Edizione;
import com.psicodramma.model.Libreria;
import com.psicodramma.model.Opera;
import com.psicodramma.model.Raccolta;
import com.psicodramma.model.Utente;
import com.psicodramma.service.LibraryService;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class LibraryServiceTest {
    private static LibraryService ls;
    private static EntityManagerFactory emf;
    private static Utente u;
    private static Opera o;

    @BeforeAll
    public static void init(){
        ls = new LibraryService("test");
        emf = Persistence.createEntityManagerFactory("test");
        EntityManager em = emf.createEntityManager();
        u = new Utente("test");
        o = new Opera(1, "test");
        em.getTransaction().begin();
        em.persist(u);
        em.persist(o);
        em.getTransaction().commit();
        em.close();
    }

    @Test
    public void addEdizione(){
        EntityManager em = emf.createEntityManager();
        Raccolta r = new Raccolta("testAdd", u);
        Libreria l = new Libreria();
        l.addRaccolta(r);
        u.setLibreria(l);  
        Edizione e = new Edizione(1, o);
        em.getTransaction().begin();
        em.persist(e);
        em.persist(r);
        em.getTransaction().commit();
        em.close();
        ls.addEdizione(e, r);
        em = emf.createEntityManager();
        Raccolta r2 = em.merge(r);
        em.close();
        assertTrue(r.getEdizioni().contains(e) && r2.getEdizioni().contains(e));
    }

    @Test
    public void removeEdizione(){
        EntityManager em = emf.createEntityManager();        
        Raccolta r = new Raccolta("testRemove", u);
        Libreria l = new Libreria();
        l.addRaccolta(r);
        u.setLibreria(l); 
        Edizione e = new Edizione(2, o);
        r.setEdizioni(new HashSet<>());
        r.addEdizione(e);
        em.getTransaction().begin();
        em.persist(e);
        em.persist(r);
        em.getTransaction().commit();
        em.close();
        ls.removeEdizione(e, r);
        em = emf.createEntityManager();
        Raccolta r2 = em.merge(r);
        em.close();
        assertFalse(r.getEdizioni().contains(e) || r2.getEdizioni().contains(e));
    }

    @Test
    public void addRaccolta(){
        Libreria l = new Libreria();
        u.setLibreria(l);  
        ls.createRaccolta("testInsert", "Prova inserimento nuova raccolta", u);
        assertTrue(u.getLibreria()
        .getRaccoltePersonali()
        .parallelStream().anyMatch(x -> x.getNome().equals("testInsert")));
    }

    @Test
    public void deleteRaccolta(){
        Libreria l = new Libreria();
        Raccolta r = new Raccolta("testDelete", u);
        l.addRaccolta(r);
        u.setLibreria(l);
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(r);
        em.getTransaction().commit();
        em.close();
        ls.deleteRaccolta(u, r);
        em = emf.createEntityManager();
        Libreria l2 = em.merge(u).getLibreria();
        em.close();
        assertFalse(l.getRaccoltePersonali().contains(r) || l2.getRaccoltePersonali().contains(r));
    }

    @Test
    public void modifyRaccolta(){
        Libreria l = new Libreria();
        Raccolta r = new Raccolta("testModify", u);
        l.addRaccolta(r);
        l.addRaccolta(new Raccolta("testModify2", u));
        u.setLibreria(l);
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(r);
        em.getTransaction().commit();
        em.close();
        assertFalse(ls.modifyRaccolta(r, "testModify2","descrizione"));
        ls.modifyRaccolta(r, "testModify3", "descrizione");
        assertTrue(u.getLibreria()
        .getRaccoltePersonali()
        .parallelStream().anyMatch(x -> x.getNome().equals("testModify3")));
    }

    @AfterAll
    public static void deleteAll(){
        EntityManager em = Persistence.createEntityManagerFactory("test").createEntityManager();
        em.getTransaction().begin();
        em.createNativeQuery("Truncate utente, raccolta, opera, edizione, edizione_raccolta restart IDENTITY cascade").executeUpdate();
        em.getTransaction().commit();
        em.close();
    }
}
