-- All course info
select * from prefix_course

-- Course full name , link to course, creation date, last modified date
SELECT
c.fullname,
CONCAT('<a target="_blank" href="%%WWWROOT%%/course/view.php',CHAR(63),'id=',c.id,'">',c.shortname,'</a>') AS 'CourseLink',
DATE_FORMAT(FROM_UNIXTIME(c.timecreated), '%Y-%m-%d %H:%i') AS 'Timecreated',
DATE_FORMAT(FROM_UNIXTIME(c.timemodified), '%Y-%m-%d %H:%i') AS 'Timemodified'
from prefix_course as c