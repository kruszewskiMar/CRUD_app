package bdbt_proj.SpringApp;

public class Adresy {
    private int nr_adresu;
    private String kraj;
    private String miasto;
    private String wojewodztwo;
    private String ulica;
    private String nr_budynku;
    private String nr_lokalu;
    private String kod_pocztowy;


    public Adresy(){

    }
    public Adresy(int nr_adresu, String kraj, String miasto, String wojewodztwo, String ulica, String nr_budynku, String nr_lokalu, String kod_pocztowy) {
        super();
        this.nr_adresu = nr_adresu;
        this.kraj = kraj;
        this.miasto = miasto;
        this.wojewodztwo = wojewodztwo;
        this.ulica = ulica;
        this.nr_budynku = nr_budynku;
        this.nr_lokalu = nr_lokalu;
        this.kod_pocztowy = kod_pocztowy;
    }

    public int getNr_adresu() {
        return nr_adresu;
    }

    public void setNr_adresu(int nr_adresu) {
        this.nr_adresu = nr_adresu;
    }

    public String getKraj() {
        return kraj;
    }

    public void setKraj(String kraj) {
        this.kraj = kraj;
    }

    public String getMiasto() {
        return miasto;
    }

    public void setMiasto(String miasto) {
        this.miasto = miasto;
    }

    public String getWojewodztwo() {
        return wojewodztwo;
    }

    public void setWojewodztwo(String wojewodztwo) {
        this.wojewodztwo = wojewodztwo;
    }

    public String getUlica() {
        return ulica;
    }

    public void setUlica(String ulica) {
        this.ulica = ulica;
    }

    public String getNr_budynku() {
        return nr_budynku;
    }

    public void setNr_budynku(String nr_budynku) {
        this.nr_budynku = nr_budynku;
    }

    public String getNr_lokalu() {
        return nr_lokalu;
    }

    public void setNr_lokalu(String nr_lokalu) {
        this.nr_lokalu = nr_lokalu;
    }

    public String getKod_pocztowy() {
        return kod_pocztowy;
    }

    public void setKod_pocztowy(String kod_pocztowy) {
        this.kod_pocztowy = kod_pocztowy;
    }
    @Override

    public String toString() {
        return "Adresy{" +
                "nr_adresu=" + nr_adresu +
                ", kraj='" + kraj + '\'' +
                ", miasto='" + miasto + '\'' +
                ", wojewodztwo='" + wojewodztwo + '\'' +
                ", ulica='" + ulica + '\'' +
                ", nr_budynku='" + nr_budynku + '\'' +
                ", nr_lokalu='" + nr_lokalu + '\'' +
                ", kod_pocztowy='" + kod_pocztowy + '\'' +
                '}';
    }
}
