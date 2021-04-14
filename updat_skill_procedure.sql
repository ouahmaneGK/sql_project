-- -----------------------------------------------------
-- Procédure qui permet de mettre à jour les compétences 
-- d'un volentaire pour une activité après un chantier
-- cette procédure va nous servire pour le trigger
-- -----------------------------------------------------

USE `woofing`;
DROP procedure IF EXISTS `update_skill`;
CREATE  PROCEDURE `update_skill`(IN worksiteID INT , IN activityID INT, IN voluntaryID INT)
BEGIN
	DECLARE cur_duration INT;
	SELECT duration INTO cur_duration FROM worksite w 
		 LEFT JOIN worksite_voluntary wv ON w.id_worksite =wv.id_worksite
		 INNER JOIN voluntary v ON wv.id_voluntary = v.id_voluntary
         INNER JOIN voluntary_activity va ON v.id_voluntary = v.id_voluntary
         WHERE w.id_worksite = worksiteID
         GROUP BY  duration;
     UPDATE voluntary_activity SET skill= skill + cur_duration
         WHERE id_activity = activityID
         AND id_voluntary = voluntaryID;
END
END$$

DELIMITER ;





