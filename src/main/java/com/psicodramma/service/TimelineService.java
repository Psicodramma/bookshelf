package com.psicodramma.service;

import java.util.List;
import java.util.Map;

import com.psicodramma.dao.AzioneDao;
import com.psicodramma.model.Azione;
import com.psicodramma.model.Utente;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class TimelineService {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("default"); 

    public List<Azione> getActionList(){
        List<Azione> res = null; 
        EntityManager em = emf.createEntityManager();
        res = em.createNativeQuery("select a.* from azione a", Azione.class).getResultList();
        return res;
    }

    public Map<String, Long> getAzioniGiorno(Utente u){
        AzioneDao ad = new AzioneDao();
        return ad.getAzioniGiorno(u.getUsername());
    }
}
