/*
Created: 11/11/2021
Modified: 11/19/2021
Model: Hurtownia_czesci_ele
Database: Oracle 19c
*/


-- Create sequences section -------------------------------------------------

CREATE SEQUENCE Hurtownie_seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Klienci_seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Dane_firmy_seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Faktury_seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Pojazdy_seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Adresy_seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Egzemplarze_seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Producenci_seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Produkty_seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Magazyny_seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Stanowiska_seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Pracownicy_seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Wynagrodzenia_seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Dostawy_seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Prawa_jazdy_seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Prawa_jazdy_kategorie_seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Kontakty_seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

-- Create tables section -------------------------------------------------

-- Table Hurotwnie

CREATE TABLE Hurotwnie(
  Nr_hurtowni Integer NOT NULL,
  Nazwa_hurtowni Varchar2(20 ) NOT NULL,
  Nr_adresu Integer NOT NULL,
  Nr_kontaktu Integer NOT NULL
)
/

-- Create indexes for table Hurotwnie

CREATE INDEX IX_Relationship7 ON Hurotwnie (Nr_adresu)
/

CREATE INDEX IX_Relationship13 ON Hurotwnie (Nr_kontaktu)
/

-- Add keys for table Hurotwnie

ALTER TABLE Hurotwnie ADD CONSTRAINT PK_Hurotwnie PRIMARY KEY (Nr_hurtowni)
/

-- Table Pracownicy

CREATE TABLE Pracownicy(
  Nr_pracownika Integer NOT NULL,
  Imie Varchar2(20 ) NOT NULL,
  Nazwisko Varchar2(30 ) NOT NULL,
  Data_urodzenia Date NOT NULL,
  PESEL Char(11 ),
  Stanowisko Varchar2(20 ) NOT NULL,
  Plec Char(1 ) NOT NULL
        CONSTRAINT CheckConstraintD1 CHECK (Plec IN ('K', 'M')),
  Nr_hurtowni Integer NOT NULL,
  Nr_adresu Integer NOT NULL,
  Nr_kontaktu Integer NOT NULL,
  Nr_Wynagrodzenia Integer NOT NULL,
  Nr_Stanowiska Integer NOT NULL
)
/

-- Create indexes for table Pracownicy

CREATE INDEX IX_Zatrudnia ON Pracownicy (Nr_hurtowni)
/

CREATE INDEX IX_Relationship9 ON Pracownicy (Nr_adresu)
/

CREATE INDEX IX_Relationship14 ON Pracownicy (Nr_kontaktu)
/

CREATE INDEX IX_Relationship1 ON Pracownicy (Nr_Wynagrodzenia)
/

CREATE INDEX IX_Relationship3 ON Pracownicy (Nr_Stanowiska)
/

-- Add keys for table Pracownicy

ALTER TABLE Pracownicy ADD CONSTRAINT PK_Pracownicy PRIMARY KEY (Nr_pracownika)
/

-- Table Pojazdy

CREATE TABLE Pojazdy(
  Nr_pojazdu Integer NOT NULL,
  Rejestracja Varchar2(10 ) NOT NULL,
  Nr_VIN Char(17 ) NOT NULL,
  Marka Varchar2(20 ) NOT NULL,
  Model Varchar2(20 ) NOT NULL,
  Potrzebna_kategoriaPJ Varchar2(2 ) NOT NULL,
  Data_przegladu Date NOT NULL,
  Pojemnosc_bagaznika Integer NOT NULL,
  Czy_automat Char(1 ),
  Rodzaj_paliwa Varchar2(10 ) NOT NULL
        CONSTRAINT CheckConstraintD2 CHECK (Rodzaj_paliwa IN ('DIESEL', 'LPG', 'BENZYNA', 'ELEKTRYCZNY','INNE')),
  Nr_hurtowni Integer NOT NULL
)
/

-- Create indexes for table Pojazdy

CREATE INDEX IX_Posiada ON Pojazdy (Nr_hurtowni)
/

-- Add keys for table Pojazdy

ALTER TABLE Pojazdy ADD CONSTRAINT Nr_pojazdu PRIMARY KEY (Nr_pojazdu)
/

-- Table Egzemplarze

CREATE TABLE Egzemplarze(
  Nr_egzemplarza Integer NOT NULL,
  Nr_partii Integer NOT NULL,
  Dostepnosc Char(1 ) NOT NULL,
  Nr_produktu Integer NOT NULL,
  Nr_faktury Integer
)
/

-- Create indexes for table Egzemplarze

CREATE INDEX IX_Ma ON Egzemplarze (Nr_produktu)
/

CREATE INDEX IX_Wystepuje_na ON Egzemplarze (Nr_faktury)
/

-- Add keys for table Egzemplarze

ALTER TABLE Egzemplarze ADD CONSTRAINT Nr_egzemplarza PRIMARY KEY (Nr_egzemplarza)
/

-- Table Produkty

CREATE TABLE Produkty(
  Nr_produktu Integer NOT NULL,
  Nazwa_produktu Varchar2(50 ) NOT NULL,
  Opis_produktu Varchar2(256 ),
  Czas_gwarancji Integer NOT NULL,
  Netto Number(10,2) NOT NULL,
  Brutto Number(10,2) NOT NULL,
  VAT Number(10,2) NOT NULL,
  Nr_hurtowni Integer NOT NULL,
  Nr_producenta Integer NOT NULL
)
/

-- Create indexes for table Produkty

CREATE INDEX IX_Dystrybuuje ON Produkty (Nr_hurtowni)
/

CREATE INDEX IX_Produkuje ON Produkty (Nr_producenta)
/

-- Add keys for table Produkty

ALTER TABLE Produkty ADD CONSTRAINT Nr_produktu PRIMARY KEY (Nr_produktu)
/

-- Table Klienci

CREATE TABLE Klienci(
  Nr_klienta Integer NOT NULL,
  Imie Varchar2(20 ) NOT NULL,
  Nazwisko Varchar2(30 ) NOT NULL,
  Data_urodzenia Date NOT NULL,
  Plec Char(1 )
        CONSTRAINT CheckConstraintD3 CHECK (Plec IN ('K', 'M')),
  Nr_hurtowni Integer NOT NULL,
  Nr_adresu Integer NOT NULL,
  Nr_kontaktu Integer NOT NULL
)
/

-- Create indexes for table Klienci

CREATE INDEX IX_Obsluguje ON Klienci (Nr_hurtowni)
/

CREATE INDEX IX_Relationship10 ON Klienci (Nr_adresu)
/

CREATE INDEX IX_Relationship12 ON Klienci (Nr_kontaktu)
/

-- Add keys for table Klienci

ALTER TABLE Klienci ADD CONSTRAINT Nr_klienta PRIMARY KEY (Nr_klienta)
/

-- Table Magazynierzy

CREATE TABLE Magazynierzy(
  Nr_pracownika Integer NOT NULL,
  Czy_glowny Char(1 ) NOT NULL
        CONSTRAINT Czy_glownyD CHECK (Czy_glowny IN ('T','N')),
  Czy_wazne_szkolenie_BHP Char(3 ) NOT NULL
        CONSTRAINT BHPD CHECK (Czy_wazne_szkolenie_BHP IN ('TAK','NIE'))
)
/

-- Add keys for table Magazynierzy

ALTER TABLE Magazynierzy ADD CONSTRAINT Nr_pracownika_magazyn PRIMARY KEY (Nr_pracownika)
/

-- Table Sprzedawcy

CREATE TABLE Sprzedawcy(
  Nr_pracownika Integer NOT NULL,
  Nr_kasy Integer NOT NULL,
  Data_ostatniego_szkolenia Date NOT NULL
)
/

-- Add keys for table Sprzedawcy

ALTER TABLE Sprzedawcy ADD CONSTRAINT Nr_pracownika_sprzedawca PRIMARY KEY (Nr_pracownika)
/

-- Table Magazyny

CREATE TABLE Magazyny(
  Nr_magazynu Integer NOT NULL,
  Metraz Integer,
  Nr_hurtowni Integer NOT NULL,
  Nr_adresu Integer NOT NULL
)
/

-- Create indexes for table Magazyny

CREATE INDEX IX_Uzywa ON Magazyny (Nr_hurtowni)
/

CREATE INDEX IX_Relationship8 ON Magazyny (Nr_adresu)
/

-- Add keys for table Magazyny

ALTER TABLE Magazyny ADD CONSTRAINT Nr_magazynu PRIMARY KEY (Nr_magazynu)
/

-- Table Faktury

CREATE TABLE Faktury(
  Nr_faktury Integer NOT NULL,
  Data_realizacji Date NOT NULL,
  Suma_netto Number(10,2) NOT NULL,
  Suma_brutto Number(10,2) NOT NULL,
  Suma_VAT Number(10,2) NOT NULL,
  Nr_hurtowni Integer NOT NULL,
  Nr_danych_firmy Integer NOT NULL,
  Nr_klienta Integer
)
/

-- Create indexes for table Faktury

CREATE INDEX IX_Kupuje_na ON Faktury (Nr_klienta)
/

CREATE INDEX IX_Wystawia ON Faktury (Nr_hurtowni)
/

CREATE INDEX IX_Relationship19 ON Faktury (Nr_danych_firmy)
/

-- Add keys for table Faktury

ALTER TABLE Faktury ADD CONSTRAINT Nr_faktury PRIMARY KEY (Nr_faktury)
/

-- Table Producenci

CREATE TABLE Producenci(
  Nr_producenta Integer NOT NULL,
  Nazwa_producenta Varchar2(50 ) NOT NULL,
  Nr_adresu Integer NOT NULL,
  Nr_kontaktu Integer NOT NULL,
  Nr_danych_firmy Integer NOT NULL
)
/

-- Create indexes for table Producenci

CREATE INDEX IX_Relationship11 ON Producenci (Nr_adresu)
/

CREATE INDEX IX_Relationship15 ON Producenci (Nr_kontaktu)
/

CREATE INDEX IX_Relationship17 ON Producenci (Nr_danych_firmy)
/

-- Add keys for table Producenci

ALTER TABLE Producenci ADD CONSTRAINT Nr_producenta PRIMARY KEY (Nr_producenta)
/

-- Table Kierowcy

CREATE TABLE Kierowcy(
  Nr_pracownika Integer NOT NULL,
  Data_waznosci_badan Date NOT NULL,
  Czy_kolizja_w_ciagu_roku Char(3 ) NOT NULL
        CONSTRAINT KolizyjnoscD CHECK (Czy_kolizja_w_ciagu_roku IN ('TAK','NIE')),
  Nr_pojazdu Integer                       
)
/

-- Create indexes for table Kierowcy

CREATE INDEX IX_Jest_prowadzony ON Kierowcy (Nr_pojazdu)
/

-- Add keys for table Kierowcy

ALTER TABLE Kierowcy ADD CONSTRAINT Nr_pracownika_kierowca PRIMARY KEY (Nr_pracownika)
/

-- Table Dostawy

CREATE TABLE Dostawy(
  Nr_dostawy Integer NOT NULL,
  Data_dostawy Date NOT NULL,
  Cena_dostawy Number(10,2) NOT NULL,
  Nr_producenta Integer NOT NULL,
  Nr_magazynu Integer NOT NULL
)
/

-- Create indexes for table Dostawy

CREATE INDEX IX_Dostarcza ON Dostawy (Nr_producenta)
/

CREATE INDEX IX_Przyjmuje ON Dostawy (Nr_magazynu)
/

-- Add keys for table Dostawy

ALTER TABLE Dostawy ADD CONSTRAINT Nr_dostawy PRIMARY KEY (Nr_dostawy)
/

-- Table Magazyny_Produkty

CREATE TABLE Magazyny_Produkty(
  Nr_magazynu Integer NOT NULL,
  Nr_produktu Integer NOT NULL
)
/

-- Table Prawa_jazdy

CREATE TABLE Prawa_jazdy(
  Nr_prawa_jazdy Integer NOT NULL,
  Data_wydania Date NOT NULL,
  Data_waznosci Date,
  Organ_wydajacy Varchar2(100 ) NOT NULL,
  Nr_pracownika Integer NOT NULL
)
/

-- Create indexes for table Prawa_jazdy

CREATE INDEX IX_Relationship4 ON Prawa_jazdy (Nr_pracownika)
/

-- Add keys for table Prawa_jazdy

ALTER TABLE Prawa_jazdy ADD CONSTRAINT PK_Prawa_jazdy PRIMARY KEY (Nr_prawa_jazdy)
/

-- Table and Columns comments section

COMMENT ON TABLE Prawa_jazdy IS 'Relacja prawa jazdy'
/
COMMENT ON COLUMN Prawa_jazdy.Nr_prawa_jazdy IS 'Identyfikator prawa jazdy'
/
COMMENT ON COLUMN Prawa_jazdy.Data_wydania IS 'Data wydania prawa jazdy'
/
COMMENT ON COLUMN Prawa_jazdy.Data_waznosci IS 'Data waznosci prawa jazdy'
/

-- Table Prawa_Jazdy_Kategorie

CREATE TABLE Prawa_Jazdy_Kategorie(
  Kod_kategorii Varchar2(2 ) NOT NULL
        CONSTRAINT Kod_KategoriiR CHECK (Kod_kategorii In ('A', 'B', 'C', 'C1', 'D', 'T')),
  Nr_prawa_jazdy Integer NOT NULL
)
/

-- Add keys for table Prawa_Jazdy_Kategorie

ALTER TABLE Prawa_Jazdy_Kategorie ADD CONSTRAINT PK_Prawa_Jazdy_Kategorie PRIMARY KEY (Nr_prawa_jazdy,Kod_kategorii)
/

-- Table Kontakty

CREATE TABLE Kontakty(
  Nr_kontaktu Integer NOT NULL,
  Nr_telefonu_firmowy Varchar2(12 ),
  Nr_telefonu Varchar2(12 ) NOT NULL,
  Nr_telefonu_pomocniczy Varchar2(12 ),
  Email Varchar2(50 ) NOT NULL
)
/

-- Add keys for table Kontakty

ALTER TABLE Kontakty ADD CONSTRAINT PK_Kontakty PRIMARY KEY (Nr_kontaktu)
/

-- Table and Columns comments section

COMMENT ON COLUMN Kontakty.Nr_kontaktu IS 'Numer kontaktu'
/

-- Table Adresy

CREATE TABLE Adresy(
  Nr_adresu Integer NOT NULL,
  Kraj Varchar2(20 ) NOT NULL,
  Miasto Varchar2(30 ) NOT NULL,
  Wojewodztwo Varchar2(20 ),
  Ulica Varchar2(30 ) NOT NULL,
  Nr_budynku Varchar2(4 ) NOT NULL,
  Nr_lokalu Varchar2(4 ),
  Kod_pocztowy Char(6 ) NOT NULL
)
/

-- Add keys for table Adresy

ALTER TABLE Adresy ADD CONSTRAINT PK_Adresy PRIMARY KEY (Nr_adresu)
/

-- Table and Columns comments section

COMMENT ON COLUMN Adresy.Nr_adresu IS 'Numer adresu'
/

-- Table Dane_firmy

CREATE TABLE Dane_firmy(
  Nr_danych_firmy Integer NOT NULL,
  Nazwa_firmy Varchar2(50 ) NOT NULL,
  NIP Integer NOT NULL,
  REGON Integer NOT NULL,
  Nr_klienta Integer
)
/

-- Create indexes for table Dane_firmy

CREATE INDEX IX_Relationship16 ON Dane_firmy (Nr_klienta)
/

-- Add keys for table Dane_firmy

ALTER TABLE Dane_firmy ADD CONSTRAINT PK_Dane_firmy PRIMARY KEY (Nr_danych_firmy)
/

-- Table Wynagordzenia

CREATE TABLE Wynagordzenia(
  Nr_Wynagrodzenia Integer NOT NULL,
  Kwota_wynagrodzenia Number(10,2) NOT NULL
)
/

-- Add keys for table Wynagordzenia

ALTER TABLE Wynagordzenia ADD CONSTRAINT PK_Wynagordzenia PRIMARY KEY (Nr_Wynagrodzenia)
/

-- Table and Columns comments section

COMMENT ON COLUMN Wynagordzenia.Nr_Wynagrodzenia IS 'Numer wynagrodzenia'
/
COMMENT ON COLUMN Wynagordzenia.Kwota_wynagrodzenia IS 'Kwota otrzymanego wynagrodzenia'
/

-- Table Stanowiska

CREATE TABLE Stanowiska(
  Nr_Stanowiska Integer NOT NULL,
  Stanowisko Varchar2(20 ) NOT NULL
)
/

-- Add keys for table Stanowiska

ALTER TABLE Stanowiska ADD CONSTRAINT PK_Stanowiska PRIMARY KEY (Nr_Stanowiska)
/

-- Trigger for sequence Hurtownie_seq1 for column Nr_hurtowni in table Hurotwnie ---------
CREATE OR REPLACE TRIGGER ts_Hurotwnie_Hurtownie_seq1 BEFORE INSERT
ON Hurotwnie FOR EACH ROW
BEGIN
  :new.Nr_hurtowni := Hurtownie_seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Hurotwnie_Hurtownie_seq1 AFTER UPDATE OF Nr_hurtowni
ON Hurotwnie FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_hurtowni in table Hurotwnie as it uses sequence.');
END;
/

-- Trigger for sequence Pracownicy_seq1 for column Nr_pracownika in table Pracownicy ---------
CREATE OR REPLACE TRIGGER ts_Pracownicy_Pracownicy_seq1 BEFORE INSERT
ON Pracownicy FOR EACH ROW
BEGIN
  :new.Nr_pracownika := Pracownicy_seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Pracownicy_Pracownicy_seq1 AFTER UPDATE OF Nr_pracownika
ON Pracownicy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_pracownika in table Pracownicy as it uses sequence.');
END;
/

-- Trigger for sequence Pojazdy_seq1 for column Nr_pojazdu in table Pojazdy ---------
CREATE OR REPLACE TRIGGER ts_Pojazdy_Pojazdy_seq1 BEFORE INSERT
ON Pojazdy FOR EACH ROW
BEGIN
  :new.Nr_pojazdu := Pojazdy_seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Pojazdy_Pojazdy_seq1 AFTER UPDATE OF Nr_pojazdu
ON Pojazdy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_pojazdu in table Pojazdy as it uses sequence.');
END;
/

-- Trigger for sequence Egzemplarze_seq1 for column Nr_egzemplarza in table Egzemplarze ---------
CREATE OR REPLACE TRIGGER ts_Egzemplarze_Egzemplarze_seq1 BEFORE INSERT
ON Egzemplarze FOR EACH ROW
BEGIN
  :new.Nr_egzemplarza := Egzemplarze_seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Egzemplarze_Egzemplarze_seq1 AFTER UPDATE OF Nr_egzemplarza
ON Egzemplarze FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_egzemplarza in table Egzemplarze as it uses sequence.');
END;
/

-- Trigger for sequence Produkty_seq1 for column Nr_produktu in table Produkty ---------
CREATE OR REPLACE TRIGGER ts_Produkty_Produkty_seq1 BEFORE INSERT
ON Produkty FOR EACH ROW
BEGIN
  :new.Nr_produktu := Produkty_seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Produkty_Produkty_seq1 AFTER UPDATE OF Nr_produktu
ON Produkty FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_produktu in table Produkty as it uses sequence.');
END;
/

-- Trigger for sequence Klienci_seq1 for column Nr_klienta in table Klienci ---------
CREATE OR REPLACE TRIGGER ts_Klienci_Klienci_seq1 BEFORE INSERT
ON Klienci FOR EACH ROW
BEGIN
  :new.Nr_klienta := Klienci_seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Klienci_Klienci_seq1 AFTER UPDATE OF Nr_klienta
ON Klienci FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_klienta in table Klienci as it uses sequence.');
END;
/

-- Trigger for sequence Magazyny_seq1 for column Nr_magazynu in table Magazyny ---------
CREATE OR REPLACE TRIGGER ts_Magazyny_Magazyny_seq1 BEFORE INSERT
ON Magazyny FOR EACH ROW
BEGIN
  :new.Nr_magazynu := Magazyny_seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Magazyny_Magazyny_seq1 AFTER UPDATE OF Nr_magazynu
ON Magazyny FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_magazynu in table Magazyny as it uses sequence.');
END;
/

-- Trigger for sequence Faktury_seq1 for column Nr_faktury in table Faktury ---------
CREATE OR REPLACE TRIGGER ts_Faktury_Faktury_seq1 BEFORE INSERT
ON Faktury FOR EACH ROW
BEGIN
  :new.Nr_faktury := Faktury_seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Faktury_Faktury_seq1 AFTER UPDATE OF Nr_faktury
ON Faktury FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_faktury in table Faktury as it uses sequence.');
END;
/

-- Trigger for sequence Producenci_seq1 for column Nr_producenta in table Producenci ---------
CREATE OR REPLACE TRIGGER ts_Producenci_Producenci_seq1 BEFORE INSERT
ON Producenci FOR EACH ROW
BEGIN
  :new.Nr_producenta := Producenci_seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Producenci_Producenci_seq1 AFTER UPDATE OF Nr_producenta
ON Producenci FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_producenta in table Producenci as it uses sequence.');
END;
/

-- Trigger for sequence Dostawy_seq1 for column Nr_dostawy in table Dostawy ---------
CREATE OR REPLACE TRIGGER ts_Dostawy_Dostawy_seq1 BEFORE INSERT
ON Dostawy FOR EACH ROW
BEGIN
  :new.Nr_dostawy := Dostawy_seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Dostawy_Dostawy_seq1 AFTER UPDATE OF Nr_dostawy
ON Dostawy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_dostawy in table Dostawy as it uses sequence.');
END;
/

-- Trigger for sequence Prawa_jazdy_seq1 for column Nr_prawa_jazdy in table Prawa_jazdy ---------
CREATE OR REPLACE TRIGGER ts_Prawa_jazdy_Prawa_jazdy_seq1 BEFORE INSERT
ON Prawa_jazdy FOR EACH ROW
BEGIN
  :new.Nr_prawa_jazdy := Prawa_jazdy_seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Prawa_jazdy_Prawa_jazdy_seq1 AFTER UPDATE OF Nr_prawa_jazdy
ON Prawa_jazdy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_prawa_jazdy in table Prawa_jazdy as it uses sequence.');
END;
/

-- Trigger for sequence Prawa_jazdy_kategorie_seq1 for column Kod_kategorii in table Prawa_Jazdy_Kategorie ---------
CREATE OR REPLACE TRIGGER ts_Prawa_Jazdy_Kategorie_Prawa_jazdy_kategorie_seq1 BEFORE INSERT
ON Prawa_Jazdy_Kategorie FOR EACH ROW
BEGIN
  :new.Kod_kategorii := Prawa_jazdy_kategorie_seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Prawa_Jazdy_Kategorie_Prawa_jazdy_kategorie_seq1 AFTER UPDATE OF Kod_kategorii
ON Prawa_Jazdy_Kategorie FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Kod_kategorii in table Prawa_Jazdy_Kategorie as it uses sequence.');
END;
/

-- Trigger for sequence Kontakty_seq1 for column Nr_kontaktu in table Kontakty ---------
CREATE OR REPLACE TRIGGER ts_Kontakty_Kontakty_seq1 BEFORE INSERT
ON Kontakty FOR EACH ROW
BEGIN
  :new.Nr_kontaktu := Kontakty_seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Kontakty_Kontakty_seq1 AFTER UPDATE OF Nr_kontaktu
ON Kontakty FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_kontaktu in table Kontakty as it uses sequence.');
END;
/

-- Trigger for sequence Adresy_seq1 for column Nr_adresu in table Adresy ---------
CREATE OR REPLACE TRIGGER ts_Adresy_Adresy_seq1 BEFORE INSERT
ON Adresy FOR EACH ROW
BEGIN
  :new.Nr_adresu := Adresy_seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Adresy_Adresy_seq1 AFTER UPDATE OF Nr_adresu
ON Adresy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_adresu in table Adresy as it uses sequence.');
END;
/

-- Trigger for sequence Dane_firmy_seq1 for column Nr_danych_firmy in table Dane_firmy ---------
CREATE OR REPLACE TRIGGER ts_Dane_firmy_Dane_firmy_seq1 BEFORE INSERT
ON Dane_firmy FOR EACH ROW
BEGIN
  :new.Nr_danych_firmy := Dane_firmy_seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Dane_firmy_Dane_firmy_seq1 AFTER UPDATE OF Nr_danych_firmy
ON Dane_firmy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_danych_firmy in table Dane_firmy as it uses sequence.');
END;
/

-- Trigger for sequence Wynagrodzenia_seq1 for column Nr_Wynagrodzenia in table Wynagordzenia ---------
CREATE OR REPLACE TRIGGER ts_Wynagordzenia_Wynagrodzenia_seq1 BEFORE INSERT
ON Wynagordzenia FOR EACH ROW
BEGIN
  :new.Nr_Wynagrodzenia := Wynagrodzenia_seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Wynagordzenia_Wynagrodzenia_seq1 AFTER UPDATE OF Nr_Wynagrodzenia
ON Wynagordzenia FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_Wynagrodzenia in table Wynagordzenia as it uses sequence.');
END;
/

-- Trigger for sequence Stanowiska_seq1 for column Nr_Stanowiska in table Stanowiska ---------
CREATE OR REPLACE TRIGGER ts_Stanowiska_Stanowiska_seq1 BEFORE INSERT
ON Stanowiska FOR EACH ROW
BEGIN
  :new.Nr_Stanowiska := Stanowiska_seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Stanowiska_Stanowiska_seq1 AFTER UPDATE OF Nr_Stanowiska
ON Stanowiska FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_Stanowiska in table Stanowiska as it uses sequence.');
END;
/


-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE Pracownicy ADD CONSTRAINT Zatrudnia FOREIGN KEY (Nr_hurtowni) REFERENCES Hurotwnie (Nr_hurtowni)
/



ALTER TABLE Pojazdy ADD CONSTRAINT Posiada FOREIGN KEY (Nr_hurtowni) REFERENCES Hurotwnie (Nr_hurtowni)
/



ALTER TABLE Magazyny ADD CONSTRAINT Uzywa FOREIGN KEY (Nr_hurtowni) REFERENCES Hurotwnie (Nr_hurtowni)
/



ALTER TABLE Klienci ADD CONSTRAINT Obsluguje FOREIGN KEY (Nr_hurtowni) REFERENCES Hurotwnie (Nr_hurtowni)
/



ALTER TABLE Produkty ADD CONSTRAINT Dystrybuuje FOREIGN KEY (Nr_hurtowni) REFERENCES Hurotwnie (Nr_hurtowni)
/



ALTER TABLE Produkty ADD CONSTRAINT Produkuje FOREIGN KEY (Nr_producenta) REFERENCES Producenci (Nr_producenta)
/



ALTER TABLE Egzemplarze ADD CONSTRAINT Ma FOREIGN KEY (Nr_produktu) REFERENCES Produkty (Nr_produktu)
/



ALTER TABLE Egzemplarze ADD CONSTRAINT Wystepuje_na FOREIGN KEY (Nr_faktury) REFERENCES Faktury (Nr_faktury)
/



ALTER TABLE Faktury ADD CONSTRAINT Kupuje_na FOREIGN KEY (Nr_klienta) REFERENCES Klienci (Nr_klienta)
/



ALTER TABLE Faktury ADD CONSTRAINT Wystawia FOREIGN KEY (Nr_hurtowni) REFERENCES Hurotwnie (Nr_hurtowni)
/



ALTER TABLE Dostawy ADD CONSTRAINT Dostarcza FOREIGN KEY (Nr_producenta) REFERENCES Producenci (Nr_producenta)
/



ALTER TABLE Dostawy ADD CONSTRAINT Przyjmuje FOREIGN KEY (Nr_magazynu) REFERENCES Magazyny (Nr_magazynu)
/



ALTER TABLE Kierowcy ADD CONSTRAINT Pracownik_jest_kierowca FOREIGN KEY (Nr_pracownika) REFERENCES Pracownicy (Nr_pracownika)
/



ALTER TABLE Magazynierzy ADD CONSTRAINT Pracownik_jest_magazynierem FOREIGN KEY (Nr_pracownika) REFERENCES Pracownicy (Nr_pracownika)
/



ALTER TABLE Sprzedawcy ADD CONSTRAINT Pracownik_jest_sprzedawca FOREIGN KEY (Nr_pracownika) REFERENCES Pracownicy (Nr_pracownika)
/



ALTER TABLE Prawa_jazdy ADD CONSTRAINT Kierowca_ma_prawo_jazdy FOREIGN KEY (Nr_pracownika) REFERENCES Kierowcy (Nr_pracownika)
/



ALTER TABLE Prawa_Jazdy_Kategorie ADD CONSTRAINT Prawo_Jazdy_ma_Kategorie FOREIGN KEY (Nr_prawa_jazdy) REFERENCES Prawa_jazdy (Nr_prawa_jazdy)
/



ALTER TABLE Hurotwnie ADD CONSTRAINT Znajduje_sie FOREIGN KEY (Nr_adresu) REFERENCES Adresy (Nr_adresu)
/



ALTER TABLE Magazyny ADD CONSTRAINT Miesci_sie FOREIGN KEY (Nr_adresu) REFERENCES Adresy (Nr_adresu)
/



ALTER TABLE Pracownicy ADD CONSTRAINT Mieszka FOREIGN KEY (Nr_adresu) REFERENCES Adresy (Nr_adresu)
/



ALTER TABLE Klienci ADD CONSTRAINT Mieszka_w FOREIGN KEY (Nr_adresu) REFERENCES Adresy (Nr_adresu)
/



ALTER TABLE Producenci ADD CONSTRAINT Ma_adres FOREIGN KEY (Nr_adresu) REFERENCES Adresy (Nr_adresu)
/



ALTER TABLE Klienci ADD CONSTRAINT Maja FOREIGN KEY (Nr_kontaktu) REFERENCES Kontakty (Nr_kontaktu)
/



ALTER TABLE Hurotwnie ADD CONSTRAINT Ma_kontakty FOREIGN KEY (Nr_kontaktu) REFERENCES Kontakty (Nr_kontaktu)
/



ALTER TABLE Pracownicy ADD CONSTRAINT Posiadaja FOREIGN KEY (Nr_kontaktu) REFERENCES Kontakty (Nr_kontaktu)
/



ALTER TABLE Producenci ADD CONSTRAINT Kontaktuje_sie_za_pomoca FOREIGN KEY (Nr_kontaktu) REFERENCES Kontakty (Nr_kontaktu)
/



ALTER TABLE Dane_firmy ADD CONSTRAINT Dane_firmy_klienta FOREIGN KEY (Nr_klienta) REFERENCES Klienci (Nr_klienta)
/



ALTER TABLE Producenci ADD CONSTRAINT Dane_firmy_producenta FOREIGN KEY (Nr_danych_firmy) REFERENCES Dane_firmy (Nr_danych_firmy)
/



ALTER TABLE Faktury ADD CONSTRAINT Faktura_na_dane_firmy FOREIGN KEY (Nr_danych_firmy) REFERENCES Dane_firmy (Nr_danych_firmy)
/



ALTER TABLE Pracownicy ADD CONSTRAINT Dostaje FOREIGN KEY (Nr_Wynagrodzenia) REFERENCES Wynagordzenia (Nr_Wynagrodzenia)
/



ALTER TABLE Pracownicy ADD CONSTRAINT Pracuje_jako FOREIGN KEY (Nr_Stanowiska) REFERENCES Stanowiska (Nr_Stanowiska)
/



ALTER TABLE Kierowcy ADD CONSTRAINT Jest_prowadzony FOREIGN KEY (Nr_pojazdu) REFERENCES Pojazdy (Nr_pojazdu)
/





