-- for converting course to a link date formats

CONCAT('<a target="_blank" href="%%WWWROOT%%/course/view.php',CHAR(63),'id=',c.id,'">',c.shortname,'</a>') AS 'CourseLink',
DATE_FORMAT(FROM_UNIXTIME(c.timecreated), '%Y-%m-%d %H:%i') AS 'Timecreated',
DATE_FORMAT(FROM_UNIXTIME(c.timemodified), '%Y-%m-%d %H:%i') AS 'Timemodified'