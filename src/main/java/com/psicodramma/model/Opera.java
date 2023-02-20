package com.psicodramma.model;
import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
@Entity
@Table(name="opera")
public class Opera extends Interagibile{
    private String titolo;
    private String descrizione;
    @Column(name="lingua_originale")
    private String lingua;
    @Transient
    private Set<String> autori;
    @Transient
    private Set<String> generi;
    private int anno;
    @OneToMany
    @JoinColumn(name = "id_opera")
    private Set<Edizione> edizioni;

    public Opera() {
    }

    public Opera(int id, String titolo, String descrizione, String lingua, Set<String> autori, Set<String> generi, int anno,
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
    public String getTitolo() {
        return titolo;
    }
    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((titolo == null) ? 0 : titolo.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Opera other = (Opera) obj;
        if (super.getId() != other.getId())
            return false;
        return true;
    }
}

