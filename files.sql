SELECT c.id "CourseID", context.id "ContextID"
,CONCAT('<a target="_new" href="%%WWWROOT%%/course/view.php?id=', c.id, '">', c.fullname ,'</a>') AS "Course Name"
, COUNT(*) "Course Files" , ROUND( SUM( f.filesize ) /1048576 ) AS file_size_MB
,CONCAT('<a target="_new" href="%%WWWROOT%%/blocks/configurable_reports/viewreport.php?alias=coursefiles&courseid=1&filter_courses=', c.id, '">List files</a>') AS "List Files"
 
FROM prefix_files AS f
JOIN prefix_context AS context ON context.id = f.contextid
JOIN prefix_course AS c ON c.id = (
  SELECT instanceid
  FROM prefix_context
  WHERE id = SUBSTRING_INDEX( SUBSTRING_INDEX( context.path, '/' , -2 ) , '/', 1 ) )
WHERE filesize >0
GROUP BY c.id

SELECT 
id ,CONCAT('<a target="_new" href="%%WWWROOT%%/pluginfile.php/', contextid, '/', component, '/', filearea, '/', itemid, '/', filename, '">', filename,'</a>') AS "File"
,filesize, mimetype ,author, license, timecreated, component, filearea, filepath
 
FROM prefix_files AS f
WHERE filesize >0
            AND f.contextid
            IN (   SELECT id
                     FROM prefix_context
                    WHERE path 
                     LIKE (   SELECT CONCAT('%/',id,'/%')
                                  AS contextquery
                                FROM prefix_context
                               WHERE 1=1
			        %%FILTER_COURSES:instanceid%%
                                 AND contextlevel = 50
                           )
                )

-- dispalys files by course id, update course id in subquery

SELECT 
id ,CONCAT('<a target="_new" href="%%WWWROOT%%/pluginfile.php/', contextid, '/', component, '/', filearea, '/', itemid, '/', filename, '">', filename,'</a>') AS "File"
,filesize, mimetype ,author, license, timecreated, component, filearea, filepath
 
FROM prefix_files AS f
WHERE filesize >0
            AND f.contextid 
			 IN (   SELECT id
                     FROM prefix_context
                    WHERE path 
                     LIKE (   SELECT CONCAT('%/',id,'/%')
                                  AS contextquery
                                FROM prefix_context
                               WHERE 
						   instanceid= 185
                                 AND contextlevel = 50
                           )
                )
           