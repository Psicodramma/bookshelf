package com.psicodramma.dao;

import java.lang.reflect.Array;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.psicodramma.model.Azione;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

@SuppressWarnings("unchecked")
public class AzioneDao {
    private EntityManagerFactory emf;

    public AzioneDao(){
        emf = Persistence.createEntityManagerFactory("default");
    }

    public List<Azione> getAzioni(){
        EntityManager em = emf.createEntityManager();
        List<Azione> res = em.createNativeQuery("select a.* from azione a", Azione.class).getResultList();;
        em.close();
        return res;
    }

    public Map<String, Long> getAzioniGiorno(String username){
        EntityManager em=emf.createEntityManager();
        String sql = "Select DATE(timestamp) as data, count(*) as num from azione where DATE(timestamp)>current_date-6 and id_utente = ?1 group by DATE(timestamp)";
        Object result[] = em.createNativeQuery(sql).setParameter(1, username).getResultList().toArray();
        Map<String, Long> azioniGiorno = new HashMap<>();
        for (Object object : result) {
            azioniGiorno.put(((Date) Array.get(object, 0)).toString(), (Long) Array.get(object, 1));
        }
        em.close();
        return azioniGiorno;
    }

    public List<Azione> getAzioniSeguiti(String username){
        EntityManager em = emf.createEntityManager();
        List<Azione> res = em.createNativeQuery("select a.* from azione a JOIN segue s on a.id_utente = s.seguito WHERE s.seguace = ?1", Azione.class)
            .setParameter(1, username)
            .getResultList();
        em.close();
        return res;
    }
}