

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------

INSERT INTO address(num, rue, complement, CP, ville) VALUES
(22, 'de la mort', ' ', 38370,'Saint Prim'),
(45, 'des Carrosses', ' ', 34370,'Maraussan'),
(8, 'de la paix', ' ', 13430,'Saint Michel sur Mer'),
(34, 'des grottes ', ' ', 36370,'Saint andré de la croix'),
(4, 'de la chêne', ' ', 69100,'Villeurbanne'),
(41, 'du bien être', ' ', 69008,'Lyon'),
(13, 'du 8 Mai 1945 ', ' ', 69800,'Saint priest'),
(9, 'de vienne', ' ', 42000,'Roanne'),
(9,25,'Razeyre',' ',34700,'Olmet-et-Villecun'),
(66, 'de paque', ' ', 38370,'Saint-alban-du-Rhone');

-- -----------------------------------------------------
-- Table `host`
-- ----------------------------------------------------- 
INSERT INTO `host`(name, lastname, presentation, id_address ) VALUES 
('Jack', 'Dupont', 'agriculteur, éleveur bovin', 1),
('Marc', 'Durieux', 'agriculteur bio', 2),
('Lionnel', 'Lemarcant', 'Maraicher, éleveur bovin', 3),
('Olivier', 'Cerise', 'Producteur de Fruit', 4),
('Pascal','Poot','agriculteur bio, éleveur ',9),
('Christophe', 'Lamane', 'Aviculteur', 10);



-- -----------------------------------------------------
-- Table `voluntary`
-- -----------------------------------------------------
INSERT INTO ` voluntary` VALUES ('Lola', 'Delafale', 5),
                               ('Elodie', 'Lemaire', 6),
                              ('Jean', 'Legrand', 7),
                              ('Théo', 'Fogiel', 8);


-- -----------------------------------------------------
-- Table `worksites`
-- ----------------------------------------------------- 
INSERT INTO `woofing`.`worksites` (`date`, `id_host`, `nbrperson`, ` id_address`,`title`,`duration`) VALUES 
                                  
('2021-03-18',1,4,1,'Une semaine avec les vache',5),
('2021-03-18',2,3,2,'La semis , c est maintenant',5),
('2021-03-19',3,5,3,'La récolte des salades',6),
('2021-03-23',4,4,4,'La la cueillette des pores',4),
('2021-03-12',1,6,1,'Frais au champ',7),
('2021-04-20',6,2,10,'Renouvellement du  chapelet',4),
('2021-04-22',5,1,9,'tout sur la volaille',5);
-- -----------------------------------------------------
-- Table `activity`
-- -----------------------------------------------------
INSERT INTO `activity` VALUES 
('maraîchage'),
('apiculture'),
('bricolages'),
('élevage'),
('agriculture bio'),
('viticulture')
('aviculture');                         ;

-- -----------------------------------------------------
-- Table `activity_worksite`
-- -----------------------------------------------------
INSERT INTO activity_worksite (id_activity,id_worksite) VALUES (2,5);
                                                              (3,3);
                                                              (4,2);
                                                              (5,4);
                                                              (7,6);
                                                              (7,7);

-- -----------------------------------------------------
-- Table `voluntary_activity`
-- -----------------------------------------------------
INSERT INTO `voluntary_activity` (`id_voluntary`,`id_activity`,`skill`) VALUES (1,1,5),
                                                                              (1,6,5),
                                                                              (2,4,7),
                                                                              (2,7,5),
                                                                              (3,2,4),
                                                                              (3,3,15,
                                                                              (4,5,19),
                                                                              (4,6,10),
                                                                              (4,7,15);

-- -----------------------------------------------------
-- Table `worksite_voluntary`
-- -----------------------------------------------------
INSERT INTO `worksite_voluntary` (`id_worksite`,`id_voluntary`,`present`) VALUES (1,1,1),
                                                                                (2,3,0),
                                                                                (2,4,1),
                                                                                (3,2,1),
                                                                                (4,2,1),
                                                                                (5,3,1),
                                                                                (7,4,1);

