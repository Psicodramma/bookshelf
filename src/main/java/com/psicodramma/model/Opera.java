package com.psicodramma.model;
import java.util.Set;

public class Opera extends Interagibile{
    private int id;
    private String titolo;
    private String descrizione;
    private String lingua;
    private Set<String> autori;
    private Set<String> generi;
    private int anno;
    private Set<Edizione> edizioni;
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getTitolo() {
        return titolo;
    }
    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }
    public String getDescrizione() {
        return descrizione;
    }
    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }
    public String getLingua() {
        return lingua;
    }
    public void setLingua(String lingua) {
        this.lingua = lingua;
    }
    public Set<String> getAutori() {
        return autori;
    }
    public void setAutori(Set<String> autori) {
        this.autori = autori;
    }
    public Set<String> getGeneri() {
        return generi;
    }
    public void setGeneri(Set<String> generi) {
        this.generi = generi;
    }
    public int getAnno() {
        return anno;
    }
    public void setAnno(int anno) {
        this.anno = anno;
    }
    public Set<Edizione> getEdizioni() {
        return edizioni;
    }
    public void setEdizioni(Set<Edizione> edizioni) {
        this.edizioni = edizioni;
    }
    
}

