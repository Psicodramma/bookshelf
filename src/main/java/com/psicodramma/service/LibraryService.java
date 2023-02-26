package com.psicodramma.service;

import java.util.Optional;
import java.util.stream.Stream;

import com.psicodramma.dao.AzioneDao;
import com.psicodramma.dao.RaccoltaDao;
import com.psicodramma.model.Edizione;
import com.psicodramma.model.Libreria;
import com.psicodramma.model.Raccolta;
import com.psicodramma.model.Utente;
import com.psicodramma.model.enums.TipoAzione;

public class LibraryService {
    private RaccoltaDao raccoltaDao;
    private AzioneDao azioneDao;

    public LibraryService(){
        raccoltaDao = new RaccoltaDao("default");
        azioneDao = new AzioneDao();
    }

    public LibraryService(String persistenceUnit){
        raccoltaDao = new RaccoltaDao(persistenceUnit);
        azioneDao = new AzioneDao(persistenceUnit);
    }

    public Libreria createLibreria(Utente u){
        Libreria l = u.getLibreria();
        l.setProprietario(u);
        for(int i=0; i<TipoAzione.values().length; i++){
            l.addRaccolta(new Raccolta(TipoAzione.values()[i].raccolta, u));
        }

        return l;
    }

    public boolean addEdizione(Edizione edizione, Raccolta raccolta){
        boolean out = raccolta.addEdizione(edizione);
        raccoltaDao.update(raccolta);
        addAzione(edizione, raccolta);
        return out;
    }

    public boolean removeEdizione(Edizione edizione, Raccolta raccolta){
        if(raccolta.removeEdizione(edizione)){
            raccoltaDao.update(raccolta);

            return true;
        }
        return false;
    }

    public boolean changeRaccolta(Edizione edizione, Raccolta source, Raccolta destination){
        if(destination != null && destination.addEdizione(edizione)){
            raccoltaDao.update(destination);
            if(source != null){
                if(source.removeEdizione(edizione)){
                    raccoltaDao.update(source);
                    addAzione(edizione, destination);
                    return true;
                } else {
                    return false;
                }
            } else {
                return true;
            }
        } else {
            return false;
        }
    }

    public Raccolta createRaccolta(String nome, String descrizione, Utente proprietario){
        Raccolta r = new Raccolta(nome, descrizione, proprietario);
        proprietario.getLibreria().addRaccolta(r);
        raccoltaDao.insert(r);
        return r;
    }

    public boolean deleteRaccolta(Utente proprietario, Raccolta raccolta){
        if(proprietario.getLibreria().getRaccoltePersonali().remove(raccolta)){
            raccoltaDao.remove(raccolta);
            return true;
        }
        return false;
    }

    public boolean modifyRaccolta(Raccolta raccolta, String nome, String descrizione){
        if(raccolta
        .getProprietario()
        .getLibreria()
        .getRaccoltePersonali()
        .parallelStream()
        .anyMatch(x -> x.getNome().equals(nome))) return false;
        raccolta.setNome(nome);
        raccolta.setDescrizione(descrizione);
        raccoltaDao.update(raccolta);
        return true;
    }
    
    public void addAzione(Edizione edizione, Raccolta raccolta) {
        Optional<TipoAzione> tipo = Stream.of(TipoAzione.values()).filter(x -> x.raccolta.equals(raccolta.getNome())).findFirst();
        if(tipo.isPresent()) azioneDao.aggiungiAzione(edizione, raccolta, tipo.get());
    }
}
