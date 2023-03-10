package com.psicodramma.service;

import java.util.List;
import java.util.Map;

import com.psicodramma.dao.AzioneDao;
import com.psicodramma.model.Azione;
import com.psicodramma.model.Edizione;
import com.psicodramma.model.Utente;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

@SuppressWarnings("unchecked")
public class TimelineService {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("default"); 
    private AzioneDao azioneDao = new AzioneDao();

    public List<Azione> getActionList(){
        return azioneDao.getAzioni();
    }

    public List<Azione> getAzioniSeguiti(Utente u){
        return azioneDao.getAzioniSeguiti(u.getUsername());
    }

    public Map<String, Long> getAzioniGiorno(Utente u){
        return azioneDao.getAzioniGiorno(u.getUsername());
    }
    
    public List<Edizione> getRaccomandati(Utente utente) {
        EntityManager em = emf.createEntityManager();
        List<Edizione> res = em.createNativeQuery(String.join("\n"
        , "select e.* "
        , "from edizione e"
        , "join opera o on o.id = e.id_opera"
        , "join genere_opera og on o.id = og.id_opera"
        , "join (select gop.id_opera as operepiaciute, gop.id_genere as generepiaciute"
        , "from genere_opera gop join Opera o on o.id = gop.id_opera join edizione e on e.id_opera = o.id"
        , "join mi_piace mp on (mp.tipo_riferimento = 'edizione' or mp.tipo_riferimento = 'opera') and mp.id_utente = ?1) ogp"
        , "on ogp.operepiaciute = o.id"
        , "join (select gop.id_opera as operelette, gop.id_genere as generelette"
        , "from genere_opera gop join Opera o on o.id = gop.id_opera join edizione e on e.id_opera = o.id"
        , "join edizione_raccolta er ON er.id_edizione = e.id and er.id_utente = ?1 where er.nome_raccolta = 'LETTI') ogp2"
        , "on ogp2.operelette = o.id"
        , "where e.id not in (select id_edizione from edizione_raccolta where id_utente = ?1) and (og.id_genere = ogp.generepiaciute or og.id_genere = ogp2.generelette)"
        ), Edizione.class).setParameter(1, utente.getUsername()).getResultList();

        if(res.size() < 5){
            res.addAll(em.createNativeQuery(String.join("\n"
            , "select e.id, e.data_pubblicazione, e.editore, e.lingua, e.id_opera, e.url"
            , "from edizione e "
            , "join mi_piace mp on (mp.tipo_riferimento = 'edizione' and e.id = mp.id_riferimento)"
            , "or (mp.tipo_riferimento = 'opera' and e.id_opera = mp.id_riferimento)"
            , "where e.id not in (select id_edizione from edizione_raccolta where id_utente = ?2)"
            , "group by e.id, e.data_pubblicazione, e.editore, e.lingua, e.id_opera, e.url"
            , "order by count(e.id) DESC"
            , "LIMIT ?1"), Edizione.class).setParameter(1, 5 - res.size()).setParameter(2, utente.getUsername()).getResultList());
        }

        return res;
    }
}
