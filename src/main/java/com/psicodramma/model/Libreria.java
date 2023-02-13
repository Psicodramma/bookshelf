package com.psicodramma.model;

import java.util.Set;

public class Libreria {
    private int id;
    private Raccolta letti;
    private Raccolta daLeggere;
    private Raccolta inLettura;
    private Raccolta accantonati;
    private Set<Raccolta> raccoltePersonali;
    private Utente proprietario;
}
