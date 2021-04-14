-- Pascal POOT est un producteur de graine bio qui decouvre notre site de woofing , 
-- il voulait s'inscrir et proposer des chantier sa quete induit plusieurs requetes 
-- sql qui vont alimenter nos table ds notre BD woofing:

-- sur la table address son adresse sera rajoutée
INSERT INTO address(num, rue, complement, CP, ville) VALUES
                          (25, 'Razeyre', ' ', 34700,'Olmet-et-Villecun');


-- sur la table host
INSERT INTO host (name, lastname, presentation, address_id_address ) VALUES 
                             ('Pascal', 'Poot', 'agriculteur bio, éleveur ', 9);


--Scérario 2:
--Sophie est déja inscrite sur l'application, a envie de découvrir 
-- l'aviculture, elle voulait participer à un chantier d'élevage de poules pondeuses.
-- Elle cherche donc un chantier pour ses vacances scolaires 
--  de deux dernières semaine du mois d'Avril dans la région Auvergne-Rhône-Alpes).



SELECT   w.* FROM worksite w 
INNER JOIN activity_worksite aw ON aw.id_worksite = w.id_worksite
right JOIN activity ac ON ac.id_activity = aw.id_activity
 where ac.name= 'aviculture'
 and w.date BETWEEN '2021-04-15' AND '2021-04-30'
 and w.id_worksite in ( select id_address from address
                      where CP  LIKE '69%' OR CP LIKE '38%' OR CP LIKE '01%' );


