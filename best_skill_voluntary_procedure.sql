-- -----------------------------------------------------
-- Procédure qui calcule qui donne le volentaire qui a le meilleur skill
-- pour une activité donnée
-- -----------------------------------------------------

USE `woofing`;
DROP procedure IF EXISTS `best_skill_voluntary`;

DELIMITER $$


CREATE PROCEDURE `best_skill_voluntary`(IN id_act INT)
BEGIN
	SELECT CONCAT(v.name , ' ' , v.lastname ) AS voluntary , va.skill
	FROM voluntary v INNER JOIN voluntary_activity va 
    ON v.id_voluntary = va.id_voluntary
    AND va.id_activity = id_act;
END

END$$

DELIMITER ;






