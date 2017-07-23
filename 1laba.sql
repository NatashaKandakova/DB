/* 1 задание*/
CREATE TABLE t_messure
  (id_messure INT NOT NULL,
  name VARCHAR2(4) NOT NULL,
  CONSTRAINT pk_messure PRIMARY KEY (ID_MESSURE)
  );
 CREATE TABLE t_material
   (id_material INT NOT NULL,
    name VARCHAR2(100) NOT NULL,
    id_messure INT NOT NULL,
    CONSTRAINT pk_material PRIMARY KEY (id_material),
    CONSTRAINT fk_material_messure
       FOREIGN KEY (id_messure) REFERENCES
        t_messure(id_messure)
    );
CREATE TABLE t_inprice
    (id_material INT NOT NULL,
     price_date DATE NOT NULL,
     price NUMBER(10,2) CHECK (price>=0),
     CONSTRAINT fk_inpice_material
       FOREIGN KEY (id_material) REFERENCES
         T_MATERIAL (ID_MATERIAL) ON DELETE CASCADE
);
CREATE TABLE t_employer
    (id_employer INT NOT NULL,
     surname VARCHAR2(20) NOT NULL,
     name VARCHAR2(20) NOT NULL,
     father_name VARCHAR(20),
     CONSTRAINT pk_employer PRIMARY KEY (id_employer)
);
CREATE TABLE t_section
      (id_section INT NOT NULL,
      name VARCHAR2(20) NOT NULL,
      id_employer INT NOT NULL,
      CONSTRAINT pk_section PRIMARY KEY (id_section),
      CONSTRAINT fk_section_employer
       FOREIGN KEY (id_employer) REFERENCES
        t_employer(id_employer) ON DELETE CASCADE
);      
CREATE TABLE t_store
    (id_store INT NOT NULL,
     name VARCHAR2(20) NOT NULL,
     CONSTRAINT pk_store PRIMARY KEY (id_store) 
);
CREATE TABLE t_caterer
    (id_caterer INT NOT NULL,
    name VARCHAR2(20) NOT NULL,
    address VARCHAR2(20) NOT NULL,
    phone INT NOT NULL,
    fax INT NOT NULL,
    CONSTRAINT pk_caterer PRIMARY KEY (id_caterer)
);
CREATE TABLE t_supply(
  id_supply INT NOT NULL,
  id_caterer INT NOT NULL,
  id_material INT NOT NULL,
  id_store INT NOT NULL,
  supply_date DATE NOT NULL,
  volume INT NOT NULL,
  CONSTRAINT pk_supply PRIMARY KEY (ID_SUPPLY),
  CONSTRAINT fk_supply_caterer
    FOREIGN KEY (ID_CATERER) REFERENCES T_CATERER(ID_CATERER),
  CONSTRAINT fk_supply_material
    FOREIGN KEY (ID_MATERIAL) REFERENCES T_MATERIAL(ID_MATERIAL),
  CONSTRAINT fk_supply_store
    FOREIGN KEY (ID_STORE) REFERENCES T_STORE(ID_STORE)
); 
CREATE TABLE t_surplus(
  id_material INT NOT NULL,
  id_store INT NOT NULL,
  volume INT CHECK (Volume >= 0),
  CONSTRAINT fk_surplus_material
    FOREIGN KEY (ID_MATERIAL) REFERENCES T_MATERIAL(ID_MATERIAL) ON DELETE CASCADE,
  CONSTRAINT fk_surplus_store
    FOREIGN KEY (ID_STORE) REFERENCES T_STORE(ID_STORE) ON DELETE CASCADE
);
CREATE TABLE t_deliver(
  id_deliver INT NOT NULL,
  id_section INT NOT NULL,
  id_material INT NOT NULL,
  id_store INT NOT NULL,
  deliver_date DATE NOT NULL,
  CONSTRAINT pk_deliver PRIMARY KEY (ID_DELIVER),
  CONSTRAINT fk_deliver_section
    FOREIGN KEY (ID_SECTION) REFERENCES T_SECTION(ID_SECTION) ON DELETE CASCADE,
  CONSTRAINT fk_deliver_material
    FOREIGN KEY (ID_MATERIAL) REFERENCES T_MATERIAL(ID_MATERIAL) ON DELETE CASCADE,
  CONSTRAINT fk_deliver_store
    FOREIGN KEY (ID_STORE) REFERENCES T_STORE(ID_STORE) ON DELETE CASCADE
);
/*2 задание*/
ALTER TABLE t_caterer
  DROP COLUMN address;
ALTER TABLE t_caterer
  ADD (legal_address VARCHAR(150) NOT NULL,
       fact_address VARCHAR(150) NOT NULL,
       e_mail VARCHAR(30)
       );
/*3 задание*/
  ALTER TABLE t_inprice
    ADD CONSTRAINT pk_inprice
     PRIMARY KEY (id_material, price_date);
/*4 задание*/
  CREATE TABLE t_group
    (id_group INT NOT NULL,
    name VARCHAR(30) NOT NULL,
    CONSTRAINT pk_group PRIMARY KEY(id_group)
    );
ALTER TABLE t_material
  ADD id_group INT
  ADD CONSTRAINT fk_group
   FOREIGN KEY (id_group) REFERENCES t_group(id_group)
   ON delete SET NULL;
/*5 задание*/
ALTER TABLE t_supply
  MODIFY (volume INT CHECK (volume>=0));


     


