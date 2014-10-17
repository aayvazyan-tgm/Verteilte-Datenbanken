CREATE TABLE Bestellung (
 bestellNr CHAR(10) NOT NULL,
 rNummer CHAR(10) NOT NULL,
 datum CHAR(10),
 lieferung CHAR(10)
);

ALTER TABLE Bestellung ADD CONSTRAINT PK_Bestellung PRIMARY KEY (bestellNr,rNummer);


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
 bankVerb CHAR(10),
 rSumme CHAR(10)
);

ALTER TABLE Rechnung ADD CONSTRAINT PK_Rechnung PRIMARY KEY (rNummer);


CREATE TABLE Speise (
 sNummer CHAR(10) NOT NULL,
 sName CHAR(10),
 zMenge CHAR(10)
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
 sNummer CHAR(10) NOT NULL,
 zName CHAR(10),
 zEinheit CHAR(10),
 zPreis CHAR(10)
);

ALTER TABLE Zutat ADD CONSTRAINT PK_Zutat PRIMARY KEY (zNummer,sNummer);


CREATE TABLE Hauptspeise (
 sNummer CHAR(10) NOT NULL
);

ALTER TABLE Hauptspeise ADD CONSTRAINT PK_Hauptspeise PRIMARY KEY (sNummer);


CREATE TABLE Lager (
 lieferantUID CHAR(10) NOT NULL,
 zNummer CHAR(10) NOT NULL,
 sNummer CHAR(10) NOT NULL,
 anz CHAR(10)
);

ALTER TABLE Lager ADD CONSTRAINT PK_Lager PRIMARY KEY (lieferantUID,zNummer,sNummer);


CREATE TABLE Lieferung (
 mName CHAR(10) NOT NULL,
 lieferantUID CHAR(10) NOT NULL
);

ALTER TABLE Lieferung ADD CONSTRAINT PK_Lieferung PRIMARY KEY (mName,lieferantUID);


CREATE TABLE Nachspeise (
 sNummer CHAR(10) NOT NULL
);

ALTER TABLE Nachspeise ADD CONSTRAINT PK_Nachspeise PRIMARY KEY (sNummer);


CREATE TABLE Posten (
 zNummer CHAR(10) NOT NULL,
 sNummer CHAR(10) NOT NULL,
 bestellNr CHAR(10) NOT NULL,
 rNummer CHAR(10) NOT NULL,
 pAnz CHAR(10),
 pNummer CHAR(10),
 pPreis CHAR(10)
);

ALTER TABLE Posten ADD CONSTRAINT PK_Posten PRIMARY KEY (zNummer,sNummer,bestellNr,rNummer);


CREATE TABLE ManueInhalt (
 sNummer CHAR(10) NOT NULL,
 mName CHAR(10) NOT NULL
);

ALTER TABLE ManueInhalt ADD CONSTRAINT PK_ManueInhalt PRIMARY KEY (sNummer,mName);


ALTER TABLE Bestellung ADD CONSTRAINT FK_Bestellung_0 FOREIGN KEY (rNummer) REFERENCES Rechnung (rNummer);


ALTER TABLE TagesMenues ADD CONSTRAINT FK_TagesMenues_0 FOREIGN KEY (mName) REFERENCES Menue (mName);


ALTER TABLE Vorspeise ADD CONSTRAINT FK_Vorspeise_0 FOREIGN KEY (sNummer) REFERENCES Speise (sNummer);


ALTER TABLE Zutat ADD CONSTRAINT FK_Zutat_0 FOREIGN KEY (sNummer) REFERENCES Speise (sNummer);


ALTER TABLE Hauptspeise ADD CONSTRAINT FK_Hauptspeise_0 FOREIGN KEY (sNummer) REFERENCES Speise (sNummer);
ALTER TABLE Hauptspeise ADD CONSTRAINT FK_Hauptspeise_1 FOREIGN KEY (sNummer) REFERENCES Speise (sNummer);


ALTER TABLE Lager ADD CONSTRAINT FK_Lager_0 FOREIGN KEY (lieferantUID) REFERENCES Lieferant (lieferantUID);
ALTER TABLE Lager ADD CONSTRAINT FK_Lager_1 FOREIGN KEY (zNummer,sNummer) REFERENCES Zutat (zNummer,sNummer);


ALTER TABLE Lieferung ADD CONSTRAINT FK_Lieferung_0 FOREIGN KEY (mName) REFERENCES Mensa (mName);
ALTER TABLE Lieferung ADD CONSTRAINT FK_Lieferung_1 FOREIGN KEY (lieferantUID) REFERENCES Lieferant (lieferantUID);


ALTER TABLE Nachspeise ADD CONSTRAINT FK_Nachspeise_0 FOREIGN KEY (sNummer) REFERENCES Speise (sNummer);


ALTER TABLE Posten ADD CONSTRAINT FK_Posten_0 FOREIGN KEY (zNummer,sNummer) REFERENCES Zutat (zNummer,sNummer);
ALTER TABLE Posten ADD CONSTRAINT FK_Posten_1 FOREIGN KEY (bestellNr,rNummer) REFERENCES Bestellung (bestellNr,rNummer);


ALTER TABLE ManueInhalt ADD CONSTRAINT FK_ManueInhalt_0 FOREIGN KEY (sNummer) REFERENCES Nachspeise (sNummer);
ALTER TABLE ManueInhalt ADD CONSTRAINT FK_ManueInhalt_1 FOREIGN KEY (mName) REFERENCES Menue (mName);
ALTER TABLE ManueInhalt ADD CONSTRAINT FK_ManueInhalt_2 FOREIGN KEY (sNummer) REFERENCES Speise (sNummer);


