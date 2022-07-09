package bdbt_proj.SpringApp;

public class Klienci {
    private int nr_klienta;
    private String imie;
    private String nazwisko;
    private String plec;
    private String nr_adresu;
    private String mail;

    public Klienci(){

    }

    public Klienci(int nr_klienta, String imie, String nazwisko, String plec, String nr_adresu, String mail) {
        super();
        this.nr_klienta = nr_klienta;
        this.imie = imie;
        this.nazwisko = nazwisko;
        this.plec = plec;
        this.nr_adresu = nr_adresu;
        this.mail = mail;
    }






    public int getNr_klienta() {
        return nr_klienta;
    }

    public void setNr_klienta(int nr_klienta) {
        this.nr_klienta = nr_klienta;
    }

    public String getImie() {
        return imie;
    }

    public void setImie(String imie) {
        this.imie = imie;
    }

    public String getNazwisko() {
        return nazwisko;
    }

    public void setNazwisko(String nazwisko) {
        this.nazwisko = nazwisko;
    }

    public String getPlec() {
        return plec;
    }

    public void setPlec(String plec) {
        this.plec = plec;
    }

    public String getNr_adresu() {
        return nr_adresu;
    }

    public void setNr_adresu(String nr_adresu) {
        this.nr_adresu = nr_adresu;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    @Override
    public String toString() {
        return "Klienci{" +
                "nr_klienta=" + nr_klienta +
                ", imie='" + imie + '\'' +
                ", nazwisko='" + nazwisko + '\'' +
                ", plec='" + plec + '\'' +
                ", nr_adresu=" + nr_adresu +
                ", mail='" + mail + '\'' +
                '}';
    }
}


