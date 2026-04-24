# Student Performance Analysis 📊

> End-to-end data analysis project examining academic performance of 100 students using Excel, SQL, and Power BI.

---

## 🛠️ Tools Used
| Tool | Purpose |
|------|---------|
| **Microsoft Excel** | Data cleaning, formatting, formulas |
| **SQL (MySQL / SQLite)** | Data querying and KPI extraction |
| **Power BI Desktop** | Interactive dashboard and visualizations |

---

## 📁 Project Structure

```
student-performance-analysis/
│
├── students_raw.xlsx        # Original dataset (with duplicates & missing values)
├── students_cleaned.xlsx    # Cleaned dataset with formulas (Final_Score, Grade)
├── queries.sql              # 9 SQL queries from beginner to intermediate
├── dashboard.pbix           # Power BI interactive dashboard
├── dashboard_screenshot.png # Screenshot of final dashboard
└── README.md                # Project documentation
```

---

## 📋 Dataset Overview

100 student records with 8 features:

| Column | Description |
|--------|-------------|
| Student_ID | Unique ID (S001–S100) |
| Gender | Male / Female |
| Study_Hours | Avg hours studied per day (1–10) |
| Attendance_Pct | % of classes attended (50–100%) |
| Math_Score | Score out of 100 |
| English_Score | Score out of 100 |
| Science_Score | Score out of 100 |
| Final_Score | Average of 3 subjects |
| Grade | A / B / C / D |

---

## 🧹 Data Cleaning (Excel)

- Removed 2 duplicate rows using **Remove Duplicates**
- Filled 7 missing scores using **IF + AVERAGE** formula
- Standardised Gender values using **TRIM + PROPER**
- Formatted Attendance as percentage
- Calculated Final_Score using **ROUND((Math+English+Science)/3, 1)**
- Added Grade column using nested **IF** formula

---

## 🗄️ SQL Analysis

9 queries covering:
- Average score per subject
- Top 5 students by Final Score
- Study hours vs performance (GROUP BY)
- Attendance groups vs score (CASE WHEN)
- Gender-wise subject comparison
- Students below class average **(Subquery)**
- Subject difficulty ranking (UNION ALL)
- Grade distribution
- High performer profile

---

## 📊 Power BI Dashboard

**KPI Cards:** Average Score · Highest Score · Total Students  
**Charts:** Bar (Top Students) · Pie (Gender Split) · Line (Study Hours Trend) · Scatter (Attendance vs Score)  
**Slicers:** Gender · Study Hours (interactive filters)

---

## 💡 Key Insights

1. Students with **7+ study hours/day scored 15–20 points higher** on average
2. **Attendance is a stronger predictor** than study hours alone — 90%+ students averaged 82 vs 58 for low attendance
3. **Science is the hardest subject** with the lowest average score (~61)
4. **Top 5 performers** all had 8+ study hours AND 90%+ attendance
5. **23% of students** scored below the class average — mainly in Science and Math
6. Female students scored higher in **English**; male students slightly higher in **Math**
7. Students studying **<3 hours never crossed 65** points — confirming minimum effort threshold

---

## 🚀 How to Run

### Excel
1. Open `students_raw.xlsx` — practice cleaning steps
2. Open `students_cleaned.xlsx` — view cleaned data and formulas

### SQL
1. Export `students_cleaned.xlsx` as CSV
2. Import into MySQL Workbench or DB Browser for SQLite
3. Run queries from `queries.sql` one by one

### Power BI
1. Open `dashboard.pbix` in Power BI Desktop (free download)
2. Use Gender/Study Hours slicers to explore data interactively

---

## 📈 Future Improvements

- Connect Power BI directly to MySQL database (live connection)
- Add regression model using Excel's Data Analysis Toolpak

---

## 👤 Author

**[Your Name]**  
Aspiring Data Analyst | Excel · SQL · Power BI  
📧 your.email@example.com  
🔗 [LinkedIn](https://linkedin.com/in/yourprofile)

---

*This project was built as part of a Data Analyst portfolio to demonstrate end-to-end data analysis skills.*
