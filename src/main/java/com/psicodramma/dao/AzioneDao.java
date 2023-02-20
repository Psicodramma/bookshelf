package com.psicodramma.dao;

import java.lang.reflect.Array;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class AzioneDao {
    private EntityManagerFactory emf;

    public AzioneDao(){
        emf = Persistence.createEntityManagerFactory("default");
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
}