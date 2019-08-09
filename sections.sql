select
    *
from
    prefix_course_sections

-- course full name and topics
select
    CONCAT('<a target="_blank" href="%%WWWROOT%%/course/view.php',CHAR(63),'id=',course.id,'">',course.shortname,'</a>') AS coursename,
section.name as topicname
from
    prefix_course_sections section
    join prefix_course course on course.id = section.course
order by coursename asc, topicname asc