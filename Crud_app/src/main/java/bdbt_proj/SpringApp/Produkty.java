package bdbt_proj.SpringApp;

public class Produkty {


    private int nr_produktu;
    private String nazwa_produktu;
    private String opis_produktu;
    private int czas_gwarancji;
    private int netto;
    private int brutto;
    private int vat;

    public Produkty(){

    }


    public Produkty(int nr_produktu, String nazwa_produktu, String opis_produktu, int czas_gwarancji, int netto, int brutto, int vat) {
        super();
        this.nr_produktu = nr_produktu;
        this.nazwa_produktu = nazwa_produktu;
        this.opis_produktu = opis_produktu;
        this.czas_gwarancji = czas_gwarancji;
        this.netto = netto;
        this.brutto = brutto;
        this.vat = vat;
    }

    public int getNr_produktu() {
        return nr_produktu;
    }

    public void setNr_produktu(int nr_produktu) {
        this.nr_produktu = nr_produktu;
    }

    public String getNazwa_produktu() {
        return nazwa_produktu;
    }

    public void setNazwa_produktu(String nazwa_produktu) {
        this.nazwa_produktu = nazwa_produktu;
    }

    public String getOpis_produktu() {
        return opis_produktu;
    }

    public void setOpis_produktu(String opis_produktu) {
        this.opis_produktu = opis_produktu;
    }

    public int getCzas_gwarancji() {
        return czas_gwarancji;
    }

    public void setCzas_gwarancji(int czas_gwarancji) {
        this.czas_gwarancji = czas_gwarancji;
    }

    public int getNetto() {
        return netto;
    }

    public void setNetto(int netto) {
        this.netto = netto;
    }

    public int getBrutto() {
        return brutto;
    }

    public void setBrutto(int brutto) {
        this.brutto = brutto;
    }

    public int getVat() {
        return vat;
    }

    public void setVat(int vat) {
        this.vat = vat;
    }


    @Override
    public String toString() {
        return "Produkty{" +
                "nr_produktu=" + nr_produktu +
                ", nazwa_produktu='" + nazwa_produktu + '\'' +
                ", opis_produktu='" + opis_produktu + '\'' +
                ", czas_gwarancji=" + czas_gwarancji +
                ", netto=" + netto +
                ", brutto=" + brutto +
                ", vat=" + vat +
               '}';
    }
}
