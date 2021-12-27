#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: reservation
#------------------------------------------------------------

CREATE TABLE reservation(
        id                   Int NOT NULL ,
        nom_du_reserveur     Varchar (255) NOT NULL ,
        prenom_du_reserveur  Varchar (255) NOT NULL ,
        heure_de_reservation Varchar (255) NOT NULL
	,CONSTRAINT reservation_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: client
#------------------------------------------------------------

CREATE TABLE client(
        id               Int NOT NULL ,
        nom_du_client    Varchar (255) NOT NULL ,
        prenom_du_client Varchar (255) NOT NULL ,
        id_reservation   Int NOT NULL
	,CONSTRAINT client_PK PRIMARY KEY (id)

	,CONSTRAINT client_reservation_FK FOREIGN KEY (id_reservation) REFERENCES reservation(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ingrédients
#------------------------------------------------------------

CREATE TABLE ingredients(
        id             Varchar (255) NOT NULL ,
        abricot        Varchar (255) NOT NULL ,
        peche          Varchar (255) NOT NULL ,
        chocolat       Varchar (255) NOT NULL ,
        coquilla       Varchar (255) NOT NULL ,
        banane         Varchar (255) NOT NULL ,
        brocoli        Varchar (255) NOT NULL ,
        tomate         Varchar (255) NOT NULL ,
        poivron        Varchar (255) NOT NULL ,
        haricot_vert   Varchar (255) NOT NULL ,
        pomme_de_terre Varchar (255) NOT NULL ,
        chou           Varchar (255) NOT NULL
	,CONSTRAINT ingredients_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: recettes
#------------------------------------------------------------

CREATE TABLE recettes(
        id                        Int NOT NULL ,
        crepe_nature              Varchar (255) NOT NULL ,
        crepe_chocolat            Varchar (255) NOT NULL ,
        chou_rouge_a_la_limousine Varchar (255) NOT NULL ,
        chilli                    Varchar (255) NOT NULL ,
        poulet_sauce_blanche      Varchar (255) NOT NULL ,
        beignet_pomme             Varchar (255) NOT NULL ,
        croutte_au_thon           Varchar (255) NOT NULL ,
        lievre_royale             Varchar (255) NOT NULL ,
        lievre_farci              Varchar (255) NOT NULL ,
        fondant_au_chocolat       Varchar (255) NOT NULL ,
        glaces                    Varchar (255) NOT NULL
	,CONSTRAINT recettes_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ustensils
#------------------------------------------------------------

CREATE TABLE ustensils(
        id          Int NOT NULL ,
        fourchettes Varchar (255) NOT NULL ,
        cuilliere   Varchar (255) NOT NULL ,
        couteaux    Varchar (255) NOT NULL ,
        plats       Varchar (255) NOT NULL ,
        bols        Varchar (255) NOT NULL
	,CONSTRAINT ustensils_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: restaurent
#------------------------------------------------------------

CREATE TABLE restaurent(
        id Int NOT NULL
	,CONSTRAINT restaurent_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: utiliser
#------------------------------------------------------------

CREATE TABLE utiliser(
        id          Varchar (255) NOT NULL ,
        id_recettes Int NOT NULL
	,CONSTRAINT utiliser_PK PRIMARY KEY (id,id_recettes)

	,CONSTRAINT utiliser_ingredients_FK FOREIGN KEY (id) REFERENCES ingredients(id)
	,CONSTRAINT utiliser_recettes0_FK FOREIGN KEY (id_recettes) REFERENCES recettes(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: appartenir
#------------------------------------------------------------

CREATE TABLE appartenir(
        id             Int NOT NULL ,
        id_ingredients Varchar (255) NOT NULL ,
        id_recettes    Int NOT NULL ,
        id_restaurent  Int NOT NULL
	,CONSTRAINT appartenir_PK PRIMARY KEY (id,id_ingredients,id_recettes,id_restaurent)

	,CONSTRAINT appartenir_ustensils_FK FOREIGN KEY (id) REFERENCES ustensils(id)
	,CONSTRAINT appartenir_ingredients0_FK FOREIGN KEY (id_ingredients) REFERENCES ingredients(id)
	,CONSTRAINT appartenir_recettes1_FK FOREIGN KEY (id_recettes) REFERENCES recettes(id)
	,CONSTRAINT appartenir_restaurent2_FK FOREIGN KEY (id_restaurent) REFERENCES restaurent(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: visiter
#------------------------------------------------------------

CREATE TABLE visiter(
        id        Int NOT NULL ,
        id_client Int NOT NULL
	,CONSTRAINT visiter_PK PRIMARY KEY (id,id_client)

	,CONSTRAINT visiter_restaurent_FK FOREIGN KEY (id) REFERENCES restaurent(id)
	,CONSTRAINT visiter_client0_FK FOREIGN KEY (id_client) REFERENCES client(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: concevoir
#------------------------------------------------------------

CREATE TABLE concevoir(
        id             Int NOT NULL ,
        id_reservation Int NOT NULL
	,CONSTRAINT concevoir_PK PRIMARY KEY (id,id_reservation)

	,CONSTRAINT concevoir_restaurent_FK FOREIGN KEY (id) REFERENCES restaurent(id)
	,CONSTRAINT concevoir_reservation0_FK FOREIGN KEY (id_reservation) REFERENCES reservation(id)
)ENGINE=InnoDB;

