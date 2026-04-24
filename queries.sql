

-- ============================================================
-- QUERY 1: Average Score for Each Subject
-- Simple aggregation — your first KPI card
-- ============================================================
SELECT
    ROUND(AVG(Math_Score), 2)    AS Avg_Math,
    ROUND(AVG(English_Score), 2) AS Avg_English,
    ROUND(AVG(Science_Score), 2) AS Avg_Science,
    ROUND(AVG(Final_Score), 2)   AS Avg_Final,
    COUNT(*)                     AS Total_Students
FROM students;


-- ============================================================
-- QUERY 2: Top 5 Students by Final Score
-- ORDER BY + LIMIT — used for bar chart
-- ============================================================
SELECT
    Student_ID,
    Gender,
    Study_Hours,
    Attendance_Pct,
    Final_Score
FROM students
ORDER BY Final_Score DESC
LIMIT 5;


-- ============================================================
-- QUERY 3: Study Hours vs Average Performance
-- GROUP BY — used for line chart
-- ============================================================
SELECT
    Study_Hours,
    ROUND(AVG(Final_Score), 2) AS Avg_Score,
    ROUND(AVG(Math_Score), 2)  AS Avg_Math,
    COUNT(*)                   AS Student_Count
FROM students
GROUP BY Study_Hours
ORDER BY Study_Hours;


-- ============================================================
-- QUERY 4: Attendance Group vs Performance
-- CASE WHEN — groups raw % into categories
-- ============================================================
SELECT
    CASE
        WHEN Attendance_Pct >= 0.90 THEN 'High (90%+)'
        WHEN Attendance_Pct >= 0.75 THEN 'Medium (75-89%)'
        ELSE                             'Low (below 75%)'
    END                        AS Attendance_Group,
    ROUND(AVG(Final_Score), 2) AS Avg_Final_Score,
    ROUND(AVG(Math_Score), 2)  AS Avg_Math,
    COUNT(*)                   AS Student_Count
FROM students
GROUP BY Attendance_Group
ORDER BY Avg_Final_Score DESC;


-- ============================================================
-- QUERY 5: Gender-wise Performance Comparison
-- GROUP BY Gender — used for clustered bar chart
-- ============================================================
SELECT
    Gender,
    ROUND(AVG(Math_Score), 2)    AS Avg_Math,
    ROUND(AVG(English_Score), 2) AS Avg_English,
    ROUND(AVG(Science_Score), 2) AS Avg_Science,
    ROUND(AVG(Final_Score), 2)   AS Avg_Final,
    MAX(Final_Score)             AS Highest_Score,
    MIN(Final_Score)             AS Lowest_Score,
    COUNT(*)                     AS Total_Students
FROM students
GROUP BY Gender;


-- ============================================================
-- QUERY 6: Students Below Class Average (Subquery)
-- Subquery — shows advanced SQL knowledge
-- ============================================================
SELECT
    Student_ID,
    Gender,
    Study_Hours,
    Final_Score,
    ROUND((SELECT AVG(Final_Score) FROM students), 2) AS Class_Average
FROM students
WHERE Final_Score < (SELECT AVG(Final_Score) FROM students)
ORDER BY Final_Score ASC;


-- ============================================================
-- QUERY 7: Subject-wise Difficulty Analysis
-- Compare which subject has lowest average (hardest)
-- ============================================================
SELECT 'Math'    AS Subject, ROUND(AVG(Math_Score), 2)    AS Avg_Score FROM students
UNION ALL
SELECT 'English' AS Subject, ROUND(AVG(English_Score), 2) AS Avg_Score FROM students
UNION ALL
SELECT 'Science' AS Subject, ROUND(AVG(Science_Score), 2) AS Avg_Score FROM students
ORDER BY Avg_Score ASC;


-- ============================================================
-- QUERY 8: Grade Distribution (A/B/C/D count)
-- COUNT with GROUP BY Grade
-- ============================================================
SELECT
    Grade,
    COUNT(*)                             AS Student_Count,
    ROUND(COUNT(*) * 100.0 / 100, 1)    AS Percentage
FROM students
GROUP BY Grade
ORDER BY Grade;


-- ============================================================
-- QUERY 9: High Performer Profile
-- Students with study >= 7 AND attendance >= 90%
-- ============================================================
SELECT
    Student_ID,
    Gender,
    Study_Hours,
    Attendance_Pct,
    Final_Score,
    Grade
FROM students
WHERE Study_Hours >= 7
  AND Attendance_Pct >= 0.90
ORDER BY Final_Score DESC;


-- ============================================================


-- ============================================================
/*
CREATE TABLE students (
    Student_ID      VARCHAR(10) PRIMARY KEY,
    Gender          VARCHAR(10),
    Study_Hours     INT,
    Attendance_Pct  DECIMAL(4,2),
    Math_Score      INT,
    English_Score   INT,
    Science_Score   INT,
    Final_Score     DECIMAL(5,1),
    Grade           CHAR(1)
);
*/
