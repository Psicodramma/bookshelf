package com.psicodramma.model;
import java.util.Set;

public class Opera extends Interagibile{
    private int id;
    private String titolo;
    private String trama;
    private String lingua;
    private Set<String> autori;
    private Set<String> generi;
    private int anno;
    private Set<Edizione> edizioni;
}

