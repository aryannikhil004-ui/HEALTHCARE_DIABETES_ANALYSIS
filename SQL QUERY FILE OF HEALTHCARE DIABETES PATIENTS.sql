select * from healthcare_diabetes

---1.How Many Patients Have Diabetes?-----
SELECT COUNT(*) AS Diabetic_Patients
FROM healthcare_diabetes
WHERE outcome = 1;

---2.Find Average Glucose Level of Diabetic vs Non-Diabetic?---
SELECT 
    outcome,
    AVG(glucose) AS Avg_Glucose
FROM healthcare_diabetes
GROUP BY outcome;

---3.Find Top 5 Highest Glucose Levels?----
SELECT TOP 5 *
FROM healthcare_diabetes
ORDER BY glucose DESC;

---4.Find Average BMI by Outcome?---
SELECT 
    outcome,
    AVG(bmi) AS Avg_BMI
FROM healthcare_diabetes
GROUP BY Outcome;

---5.How many Patients Above Age 50 With Diabetes?--
SELECT *
FROM healthcare_diabetes
WHERE Age > 50 AND outcome = 1;

---6.Find Lowest Blood Pressure Rank per Age Group?---
SELECT *,
    RANK() OVER (
        PARTITION BY 
        CASE 
            WHEN age < 30 THEN 'Under30'
            WHEN age BETWEEN 30 AND 50 THEN '30-50'
            ELSE 'Above50'
        END
        ORDER BY bloodpressure
    ) AS BP_Rank
FROM healthcare_diabetes;

--7.Find Highest Risk Profile (High BMI + High Glucose)?---
SELECT *
FROM healthcare_diabetes
WHERE bmi > 30 AND glucose > 140;

---8.Find the Above Average BMI Diabetic?---
SELECT * FROM healthcare_diabetes
WHERE bmi > (SELECT AVG(bmi) FROM healthcare_diabetes)
AND outcome = 1;

---9.Find Avg Glucose by Outcome?---
SELECT Outcome, AVG(glucose) as Avg_glucose
FROM healthcare_diabetes
GROUP BY outcome;

---10.Find Age Group Classification?---
SELECT *,
CASE 
 WHEN age < 30 THEN 'Young'
 WHEN age BETWEEN 30 AND 50 THEN 'Middle'
 ELSE 'Senior'
END AS Age_Group
FROM healthcare_diabetes;


