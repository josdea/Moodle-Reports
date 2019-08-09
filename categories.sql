-- select all categories
select * from prefix_course_categories

-- all categories and their parent name
select cat.name as category, cat2.name as categoryparent from prefix_course_categories cat
left join prefix_course_categories cat2 on cat.parent = cat2.id