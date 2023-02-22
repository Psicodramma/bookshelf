package com.psicodramma;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.Date;
import java.util.Set;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.psicodramma.dao.InteragibileDao;
import com.psicodramma.model.Commento;
import com.psicodramma.model.Opera;
import com.psicodramma.model.Utente;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Persistence;

public class InteragibileDaoTest {
    private static InteragibileDao intDao;
    private static Utente testUtente;
    private static Opera testOpera;

    @BeforeAll
    public static void initInteragibileDao(){
        testUtente = new Utente("Test");
        intDao = new InteragibileDao("test");
        testOpera = new Opera(1, "test", "Opera di test", "test", null, null, 0, null);
        testOpera.setCommenti(Set.of());
        testOpera.setLike(Set.of());
        EntityManager em = Persistence.createEntityManagerFactory("test").createEntityManager();
        em.getTransaction().begin();
        em.persist(testUtente);
        em.persist(testOpera);
        em.getTransaction().commit();
        em.close();
    }

    @Test
    public void addCommentoOpera(){
        Commento c = new Commento(testUtente, "test", new Date(), testOpera);
        intDao.addComment(c);
        assertTrue(intDao.getCommentiSet(testOpera).contains(c));   
    }

    @Test
    public void addCommentoNested(){
        Commento c = new Commento(testUtente, "test", new Date(), testOpera);
        c.setId(1);
        c.setCommenti(Set.of());
        Commento c2 = new Commento(testUtente, "test", new Date(), c);
        intDao.addComment(c2);
        assertTrue(intDao.getCommentiSet(c).contains(c2));
    }

    @Test
    public void addRemoveLikeOpera(){
        intDao.addLike(testOpera, testUtente);
        assertTrue(intDao.getLikeSet(testOpera).contains("Test"));
        intDao.removeLike(testOpera, testUtente);
        assertFalse(intDao.getLikeSet(testOpera).contains("Test"));
        
    }
    @Test
    public void addRemoveLikeCommento(){
        Commento c = new Commento(testUtente, "test", new Date(), testOpera);
        c.setId(1);
        intDao.addLike(c, testUtente);
        assertTrue(intDao.getLikeSet(c).contains("Test"));
        intDao.removeLike(c, testUtente);
        assertFalse(intDao.getLikeSet(c).contains("Test"));
    }

    @AfterAll
    public static void deleteAll(){
        EntityManager em = Persistence.createEntityManagerFactory("test").createEntityManager();
        em.getTransaction().begin();
        em.createNativeQuery("Truncate autore, autore_opera, azione, commento, edizione, edizione_raccolta, genere, genere_opera, mi_piace, opera, raccolta, segue, utente").executeUpdate();
        em.getTransaction().commit();
        em.close();
    }
}
