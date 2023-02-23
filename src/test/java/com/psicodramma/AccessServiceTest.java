package com.psicodramma;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.psicodramma.model.Utente;
import com.psicodramma.service.AccessService;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceException;

public class AccessServiceTest {

    private static AccessService as;

    @BeforeAll
    public static void initTest(){
        as = new AccessService("test");
        EntityManager em = Persistence.createEntityManagerFactory("test").createEntityManager();
        Utente u = new Utente("test", "test", "test");
        em.getTransaction().begin();
        em.persist(u);
        em.getTransaction().commit();
        em.close();
    }
    @Test
    public void registerTest(){
        Utente u = new Utente("testRegister", "test", "test");
        assertThrows(PersistenceException.class, () -> as.getUser("testRegister"));
        as.register("testRegister", "test", "test");
        assertEquals(as.getUser("testRegister"), u);
    }

    @Test
    public void loginTest(){
        assertTrue(as.login("test", "test"));
        assertFalse(as.login("username", "password"));
    }

    @Test
    public void recuperaPasswordTest(){
        assertEquals("test", as.restorePassword("test"));
        assertNotEquals("password", as.restorePassword("test"));
    }

    @AfterAll
    public static void deleteAll(){
        EntityManager em = Persistence.createEntityManagerFactory("test").createEntityManager();
        em.getTransaction().begin();
        em.createNativeQuery("Truncate utente");
        em.getTransaction().commit();
        em.close();
    }

}
