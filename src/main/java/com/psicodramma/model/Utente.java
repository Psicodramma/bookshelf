package com.psicodramma.model;

import java.util.Set;

public class Utente {
    private int id;
    private String username;
    private String nazionalita;
    private Libreria libreria;
    private Set<Utente> amici;
}
