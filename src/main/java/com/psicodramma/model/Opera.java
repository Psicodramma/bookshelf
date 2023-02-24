package com.psicodramma.model;
import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="opera")
public class Opera extends Interagibile{
    private String titolo;
    private String descrizione;
    @Column(name="lingua_originale")
    private String lingua;
    @ManyToMany
    @JoinTable(
        name = "autore_opera", 
        joinColumns = @JoinColumn(name = "id_opera"), 
        inverseJoinColumns = @JoinColumn(name = "id_autore"))
    private Set<Autore> autori;
    @ManyToMany
    @JoinTable(
        name = "genere_opera", 
        joinColumns = @JoinColumn(name = "id_opera"), 
        inverseJoinColumns = @JoinColumn(name = "id_genere"))
    private Set<Genere> generi;
    private int anno;
    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_opera")
    private Set<Edizione> edizioni;

    public Opera() {
    }

    public Opera(int id, String titolo){
        super.setId(id);
        this.titolo = titolo;
    }

    public Opera(int id, String titolo, String descrizione, String lingua, Set<Autore> autori, Set<Genere> generi, int anno,
            Set<Edizione> edizioni) {
        super.setId(id);
        this.titolo = titolo;
        this.descrizione = descrizione;
        this.lingua = lingua;
        this.autori = autori;
        this.generi = generi;
        this.anno = anno;
        this.edizioni = edizioni;
    }

    public Opera(String titolo, String descrizione, String lingua, Set<Autore> autori, Set<Genere> generi, int anno,
            Set<Edizione> edizioni) {
        this.titolo = titolo;
        this.descrizione = descrizione;
        this.lingua = lingua;
        this.autori = autori;
        this.generi = generi;
        this.anno = anno;
        this.edizioni = edizioni;
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
    public Set<Autore> getAutori() {
        return autori;
    }
    public void setAutori(Set<Autore> autori) {
        this.autori = autori;
    }
    public Set<Genere> getGeneri() {
        return generi;
    }
    public void setGeneri(Set<Genere> generi) {
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
    public String getTitolo() {
        return titolo;
    }
    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    public String getGeneriToString(){
        String sGeneri = "";
        for(Genere g : generi){
            sGeneri = String.join(", ", g.getNome(), sGeneri);
        }
        return sGeneri;
    }

    public String getAutoriToString(){
        String sAutori = "";
        for(Autore a : autori){
            sAutori = String.join(", ", a.toString(), sAutori);
        }
        return sAutori;
    }

}

