package com.psicodramma.service;

import com.psicodramma.dao.RaccoltaDao;
import com.psicodramma.model.Edizione;
import com.psicodramma.model.Libreria;
import com.psicodramma.model.Raccolta;
import com.psicodramma.model.Utente;
import com.psicodramma.model.enums.TipoAzione;

public class LibraryService {
    private RaccoltaDao raccoltaDao;

    public LibraryService(){
        raccoltaDao = new RaccoltaDao("default");
    }

    public LibraryService(String persistenceUnit){
        raccoltaDao = new RaccoltaDao(persistenceUnit);
    }

    public Libreria createLibreria(Utente u){
        Libreria l = u.getLibreria();
        l.setProprietario(u);
        for(int i=0; i<TipoAzione.values().length; i++){
            l.addRaccolta(new Raccolta(TipoAzione.values()[i].toString(), u));
        }

        return l;
    }

    public boolean addEdizione(Edizione edizione, Raccolta raccolta){
        boolean out = raccolta.addEdizione(edizione);
        raccoltaDao.update(raccolta);
        return out;
    }

    public boolean removeEdizione(Edizione edizione, Raccolta raccolta){
        if(raccolta.removeEdizione(edizione)){
            raccoltaDao.update(raccolta);
            return true;
        }
        return false;
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
    

}
