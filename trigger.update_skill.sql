-- -----------------------------------------------------
-- Trigger qui mis à jour les competances d'un volentaire après la validation de sa 
-- présence par le host , la compétence pour une activité est le nombre de points
-- qui correspond au nombre de jour passés sur une activités 
-- -----------------------------------------------------

DROP TRIGGER IF EXISTS `woofing`.`worksite_voluntary_AFTER_UPDATE`;

DELIMITER $$
USE `employees`$$


CREATE  TRIGGER `woofing`.`worksite_voluntary_AFTER_UPDATE` 

AFTER UPDATE ON `worksite_voluntary` FOR EACH ROW
BEGIN
    DECLARE cur_activityID INT;
	if new.present = 1 then
    
    SELECT a.id_activity INTO cur_activityID FROM activity a 
		 LEFT JOIN activity_worksite aw  ON a.id_activity =aw.id_activity
		 INNER JOIN worksite w ON w.id_worksite = aw.id_worksite
         WHERE w.id_worksite = new.id_worksite
          GROUP BY a.id_activity;
    CALL update_skill(	new.id_worksite, cur_activityID, new.id_voluntary);
    end if;
END