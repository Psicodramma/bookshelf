package com.psicodramma;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.HashSet;
import java.util.Optional;
import java.util.stream.Stream;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.psicodramma.dao.AzioneDao;
import com.psicodramma.model.Azione;
import com.psicodramma.model.Edizione;
import com.psicodramma.model.Libreria;
import com.psicodramma.model.Opera;
import com.psicodramma.model.Raccolta;
import com.psicodramma.model.Utente;
import com.psicodramma.model.enums.TipoAzione;
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
        u = new Utente("testLibraryService");
        o = new Opera(1, "testLibraryService");
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
        Edizione e = new Edizione(1, o);
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
        assertFalse(r.contains(e) || r2.contains(e));
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

    @Test
    public void aggiungiAzione(){
        //Inizializzazione dati per test
        EntityManager em = emf.createEntityManager();        
        Raccolta r = new Raccolta("In lettura", u);
        Raccolta r2 = new Raccolta("testAzione", u);
        Libreria l = new Libreria();
        //Aggiunta delle raccolte alla libreria e libreria all'utente
        l.addRaccolta(r);
        l.addRaccolta(r2);
        u.setLibreria(l); 
        Edizione e = new Edizione(1, o);
        r.setEdizioni(new HashSet<>());
        r.addEdizione(e);
        r2.setEdizioni(new HashSet<>());
        r2.addEdizione(e);
        //Persist degli oggetti sul database
        em.getTransaction().begin();
        em.persist(e);
        em.persist(r);
        em.persist(r2);
        em.getTransaction().commit();
        em.close();
        //Aggiunta azioni su r e r2
        ls.addAzione(e, r);
        ls.addAzione(e, r2);
        AzioneDao azioneDao = new AzioneDao("test");
        //Ritorna un optional che contiene l'azione fatta sulla raccolta "In lettura"
        Optional<Azione> azione = azioneDao.getAzioni().parallelStream().filter(x -> 
            x.getAzione().equals(TipoAzione.INLETTURA) 
            && x.getEdizione().equals(e) 
            && x.getUtente().equals(u))
            .findAny();
        assertTrue(azione.isPresent());
        //Cerca se in tutte le azioni è presente quella fatta su r2 che sia diversa da quella fatta su "In lettura"
        assertFalse(azioneDao.getAzioni().parallelStream().anyMatch(x -> 
            !x.equals(azione.get()) 
            && Stream.of(TipoAzione.values()).anyMatch(y -> x.getAzione().equals(y)) 
            && x.getEdizione().equals(e) 
            && x.getUtente().equals(u)));
    }

    @AfterEach
    public void deleteEach(){
        EntityManager em = Persistence.createEntityManagerFactory("test").createEntityManager();
        em.getTransaction().begin();
        em.createNativeQuery("Truncate azione, edizione, edizione_raccolta, raccolta restart IDENTITY cascade").executeUpdate();
        em.getTransaction().commit();
        em.close();
    }

    @AfterAll
    public static void deleteAll(){
        EntityManager em = Persistence.createEntityManagerFactory("test").createEntityManager();
        em.getTransaction().begin();
        em.createNativeQuery("Truncate utente, azione, raccolta, opera, edizione, edizione_raccolta restart IDENTITY cascade").executeUpdate();
        em.getTransaction().commit();
        em.close();
    }
}
