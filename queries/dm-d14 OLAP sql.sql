-- Roll-up Operation (Summarizing at a higher level)
--Query: Get total social media usage time by year of study.
SELECT c.year_of_study, SUM(af.social_media_time) AS Total_Social_Media_Time
FROM academics_fact af
JOIN student_dim s ON af.student_id = s.student_id
JOIN class_dim c ON s.class_id = c.class_id
GROUP BY c.year_of_study
ORDER BY c.year_of_study;


--Drill-down Operation (Breaking data into more detail)
--Query: Get total study time by year of study and then by branch.
SELECT c.year_of_study, c.branch, SUM(af.study_time) AS Total_Study_Time
FROM academics_fact af
JOIN student_dim s ON af.student_id = s.student_id
JOIN class_dim c ON s.class_id = c.class_id
GROUP BY c.year_of_study, c.branch
ORDER BY c.year_of_study, c.branch;


--Slice Operation (Selecting a single dimension value)
--Query: Get the total study time for students who use a specific social media platform (e.g., Instagram).
SELECT platform_name, SUM(study_time) AS Total_Study_Time
FROM academics_fact af
JOIN social_media_dim sm ON af.platform_id = sm.platform_id
WHERE sm.platform_name = 'Instagram'
GROUP BY platform_name;

--Dice Operation (Filtering on multiple dimensions)
--Query: Find the average CGPA of 3rd-year CSE students using Facebook.
SELECT c.year_of_study, c.branch, sm.platform_name, AVG(af.cgpa) AS Avg_CGPA
FROM academics_fact af
JOIN student_dim s ON af.student_id = s.student_id
JOIN class_dim c ON s.class_id = c.class_id
JOIN social_media_dim sm ON af.platform_id = sm.platform_id
WHERE c.year_of_study = 'III' AND c.branch = 'CSE' AND sm.platform_name = 'Facebook'
GROUP BY c.year_of_study, c.branch, sm.platform_name;

--Pivot (Cross-tab) Operation
--Query: Get total social media usage by branch and preparation type.
SELECT c.branch, sm.platform_name, SUM(af.social_media_time) AS Total_Social_Media_Time
FROM academics_fact af
JOIN student_dim s ON af.student_id = s.student_id
JOIN class_dim c ON s.class_id = c.class_id
JOIN social_media_dim sm ON af.platform_id = sm.platform_id
GROUP BY CUBE (c.branch, sm.platform_name)
ORDER BY c.branch, sm.platform_name;
