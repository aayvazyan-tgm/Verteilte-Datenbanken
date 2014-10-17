CREATE TABLE Lieferant (
 lieferantUID CHAR(10) NOT NULL,
 adresse CHAR(10)
);

ALTER TABLE Lieferant ADD CONSTRAINT PK_Lieferant PRIMARY KEY (lieferantUID);


CREATE TABLE Mensa (
 mName CHAR(10) NOT NULL,
 kundenNr CHAR(10)
);

ALTER TABLE Mensa ADD CONSTRAINT PK_Mensa PRIMARY KEY (mName);


CREATE TABLE Menue (
 mName CHAR(10) NOT NULL,
 preis CHAR(10)
);

ALTER TABLE Menue ADD CONSTRAINT PK_Menue PRIMARY KEY (mName);


CREATE TABLE Rechnung (
 rNummer CHAR(10) NOT NULL,
 rSumme CHAR(10),
 bankVerb CHAR(10)
);

ALTER TABLE Rechnung ADD CONSTRAINT PK_Rechnung PRIMARY KEY (rNummer);


CREATE TABLE Speise (
 sNummer CHAR(10) NOT NULL,
 sName CHAR(10),
 sMenge CHAR(10)
);

ALTER TABLE Speise ADD CONSTRAINT PK_Speise PRIMARY KEY (sNummer);


CREATE TABLE TagesMenues (
 Datum CHAR(10) NOT NULL,
 mName CHAR(10) NOT NULL
);

ALTER TABLE TagesMenues ADD CONSTRAINT PK_TagesMenues PRIMARY KEY (Datum,mName);


CREATE TABLE Vorspeise (
 sNummer CHAR(10) NOT NULL
);

ALTER TABLE Vorspeise ADD CONSTRAINT PK_Vorspeise PRIMARY KEY (sNummer);


CREATE TABLE Zutat (
 zNummer CHAR(10) NOT NULL,
 zName CHAR(10),
 zEinheit CHAR(10),
 zPreis CHAR(10)
);

ALTER TABLE Zutat ADD CONSTRAINT PK_Zutat PRIMARY KEY (zNummer);


CREATE TABLE Bestellung (
 bestellNr CHAR(10) NOT NULL,
 datum CHAR(10),
 lieferung CHAR(10)
);

ALTER TABLE Bestellung ADD CONSTRAINT PK_Bestellung PRIMARY KEY (bestellNr);


CREATE TABLE Hauptspeise (
 sNummer CHAR(10) NOT NULL
);

ALTER TABLE Hauptspeise ADD CONSTRAINT PK_Hauptspeise PRIMARY KEY (sNummer);


CREATE TABLE Lager (
 lieferantUID CHAR(10) NOT NULL,
 zNummer CHAR(10) NOT NULL,
 lanz CHAR(10)
);

ALTER TABLE Lager ADD CONSTRAINT PK_Lager PRIMARY KEY (lieferantUID,zNummer);


CREATE TABLE Lieferung (
 mName CHAR(10) NOT NULL,
 lieferantUID CHAR(10) NOT NULL
);

ALTER TABLE Lieferung ADD CONSTRAINT PK_Lieferung PRIMARY KEY (mName,lieferantUID);


CREATE TABLE MenueInhalt (
 mName CHAR(10) NOT NULL,
 sNummer CHAR(10) NOT NULL
);

ALTER TABLE MenueInhalt ADD CONSTRAINT PK_MenueInhalt PRIMARY KEY (mName,sNummer);


CREATE TABLE Nachspeise (
 sNummer CHAR(10) NOT NULL
);

ALTER TABLE Nachspeise ADD CONSTRAINT PK_Nachspeise PRIMARY KEY (sNummer);


CREATE TABLE Posten (
 zNummer CHAR(10) NOT NULL,
 bestellNr CHAR(10) NOT NULL,
 pAnz CHAR(10),
 pNummer CHAR(10),
 pPreis CHAR(10)
);

ALTER TABLE Posten ADD CONSTRAINT PK_Posten PRIMARY KEY (zNummer,bestellNr);


CREATE TABLE Rezept (
 sNummer CHAR(10) NOT NULL,
 zNummer CHAR(10) NOT NULL
);

ALTER TABLE Rezept ADD CONSTRAINT PK_Rezept PRIMARY KEY (sNummer,zNummer);


ALTER TABLE TagesMenues ADD CONSTRAINT FK_TagesMenues_0 FOREIGN KEY (mName) REFERENCES Menue (mName);


ALTER TABLE Vorspeise ADD CONSTRAINT FK_Vorspeise_0 FOREIGN KEY (sNummer) REFERENCES Speise (sNummer);


ALTER TABLE Hauptspeise ADD CONSTRAINT FK_Hauptspeise_0 FOREIGN KEY (sNummer) REFERENCES Speise (sNummer);


ALTER TABLE Lager ADD CONSTRAINT FK_Lager_0 FOREIGN KEY (lieferantUID) REFERENCES Lieferant (lieferantUID);
ALTER TABLE Lager ADD CONSTRAINT FK_Lager_1 FOREIGN KEY (zNummer) REFERENCES Zutat (zNummer);


ALTER TABLE Lieferung ADD CONSTRAINT FK_Lieferung_0 FOREIGN KEY (mName) REFERENCES Mensa (mName);
ALTER TABLE Lieferung ADD CONSTRAINT FK_Lieferung_1 FOREIGN KEY (lieferantUID) REFERENCES Lieferant (lieferantUID);


ALTER TABLE MenueInhalt ADD CONSTRAINT FK_MenueInhalt_0 FOREIGN KEY (mName) REFERENCES Menue (mName);
ALTER TABLE MenueInhalt ADD CONSTRAINT FK_MenueInhalt_1 FOREIGN KEY (sNummer) REFERENCES Speise (sNummer);


ALTER TABLE Nachspeise ADD CONSTRAINT FK_Nachspeise_0 FOREIGN KEY (sNummer) REFERENCES Speise (sNummer);


ALTER TABLE Posten ADD CONSTRAINT FK_Posten_0 FOREIGN KEY (zNummer) REFERENCES Zutat (zNummer);
ALTER TABLE Posten ADD CONSTRAINT FK_Posten_1 FOREIGN KEY (bestellNr) REFERENCES Bestellung (bestellNr);


ALTER TABLE Rezept ADD CONSTRAINT FK_Rezept_0 FOREIGN KEY (sNummer) REFERENCES Speise (sNummer);
ALTER TABLE Rezept ADD CONSTRAINT FK_Rezept_1 FOREIGN KEY (zNummer) REFERENCES Zutat (zNummer);


