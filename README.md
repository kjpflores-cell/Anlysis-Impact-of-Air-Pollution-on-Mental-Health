# 🌍 Impact of Air Pollution on Mental Health: A Data Analysis Case Study

![Visualization](air_pollution_sleep_stress_correlation.png)

---

## 🔍 Overview
This project analyzes the relationship between **air pollution (NO₂ levels)** and **mental health indicators** (focus on **sleep duration/quality**), using data from **Barcelona**. The work shows an end-to-end data analysis process: initial cleaning and exploration in **Google Sheets**, followed by a reproducible analysis and publication-quality visualization in **R**.

---

## 🎯 Objectives
- Evaluate if and how **NO₂ concentration** is associated with **sleep duration**.  
- Compare patterns between **high-pollution** and **low-pollution** days.  
- Produce clear, actionable visualizations and document a reproducible workflow.

---

## ✅ Key Insights (Executive Summary)
- There is a **negative association**: higher **NO₂** values tend to correspond with **shorter reported sleep duration**.  
- Visual signals are clearer after moving from Google Sheets to R for plotting and trend estimation.  
- Results indicate potential public-health relevance; however, **correlation does not prove causation**.

---

## 🛠 Tools & Libraries
- **Google Sheets** — initial cleaning & pivot tables  
- **R** — reproducible analysis (packages used: `readr`, `dplyr`, `ggplot2`)  

---

## 📂 Project files (exact names in this repo)
- `CitieSHealth_BCN_DATA_PanelStudy_20220414.csv` — Original dataset (Kaggle / CitieSHealth).  
- `Impact_Air-Pollution_on_Mental-Health_AnalysisV1` — Google Sheets initial analysis (link below).  
- `analysis_air_pollution.R` — R script containing the full data wrangling and plotting pipeline.  
- `air_pollution_sleep_stress_correlation.png` — Final visualization exported from R.  
- `README.md` — This documentation.

---

## 📊 Analysis workflow
### Phase 1 — Google Sheets (initial)
- Quick cleaning: remove duplicates, normalize date formats, handle missing values.  
- Exploratory pivot tables and simple charts used to shape the main hypothesis and variables of interest.  
- Link to initial sheet: [Impact_Air-Pollution_on_Mental-Health_AnalysisV1](https://docs.google.com/spreadsheets/d/1l04DSKw9kZwAJBKQGaKQeLCNJmh-RMRSU56GCbGP2Kw/edit?gid=506892392#gid=506892392)

### Phase 2 — R (reproducible analysis)
- Load CSV, validate types, and apply consistent cleaning with `dplyr`.  
- Produce scatter plot with linear smoothing to visualize the Sleep vs NO₂ relationship.  
- Export final PNG for presentation and embedding.

---

## 🖼 Visualizations
- **Sleep vs NO₂ (scatter plot + trend line)**  
  ![Sleep vs NO2](air_pollution_sleep_stress_correlation.png)

*(Additional plots can be added here if you export them from the R script.)*

---

## ▶ How to reproduce (exact steps)
**Option A — using the CSV included in this repo (recommended)**
1. Ensure the file `CitieSHealth_BCN_DATA_PanelStudy_20220414.csv` is in the repo root.  
2. Open `analysis_air_pollution.R` in RStudio.  
3. Run the script (it will read the CSV, perform cleaning, and save `air_pollution_sleep_stress_correlation.png`).

**Minimal example (inside `analysis_air_pollution.R`)**:
```r
# Required packages
library(readr)
library(dplyr)
library(ggplot2)

# Load data (ensure filename matches exactly)
df <- read_csv("CitieSHealth_BCN_DATA_PanelStudy_20220414.csv")

# Example minimal cleaning (adjust column names to your dataset)
df_clean <- df %>%
  mutate(
    no2 = as.numeric(NO2),            # replace NO2 with your exact column name if different
    sleep_hours = as.numeric(SleepHours)  # replace SleepHours with your exact column name
  ) %>%
  filter(!is.na(no2), !is.na(sleep_hours))

# Visualization
p <- ggplot(df_clean, aes(x = no2, y = sleep_hours)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", se = TRUE, color = "#2C3E50") +
  labs(
    title = "Sleep Duration vs NO₂ (Barcelona)",
    x = "NO₂ (µg/m³)",
    y = "Sleep duration (hours)"
  ) +
  theme_minimal()

ggsave("air_pollution_sleep_stress_correlation.png", plot = p, width = 8, height = 5, dpi = 300)
Option B — start from Google Sheets (quick check)

Open the Google Sheet (link above) and export: File → Download → Comma-separated values (.csv).

Save as CitieSHealth_BCN_DATA_PanelStudy_20220414.csv in the repo root.

Run analysis_air_pollution.R as above.

⚠ Challenges & Solutions
Inconsistent column formats and missing values — standardized column names and types in Sheets before loading into R.

Noisy signals / outliers — applied simple filters and plotted trend lines to make relationships clearer for presentation.

Versioning between Sheets and R — documented first-version sheet and the final R outputs; final figures come from R.

📏 Limitations
Self-reported mental health / sleep metrics may include recall or reporting bias.

Single-city (Barcelona) panel — results may not generalize.

This analysis is exploratory and descriptive: further modeling (controls, causal inference) required for policy claims.

🚀 Next steps (suggested)
Add SQL-based exploration for complex joins and aggregated queries.

Build an interactive dashboard (Tableau / Power BI) for non-technical stakeholders.

Extend dataset across cities or years to strengthen inference and test robustness.

Consider time-series or mixed models to control for seasonality and individual fixed effects.

📚 References
Dataset: CitieSHealth Project — Air Pollution & Mental Health (Barcelona) (Kaggle):
https://www.kaggle.com/datasets/thedevastator/air-pollution-and-mental-health?resource=download

👩‍💻 Author
Karen Flores
🔗 https://www.linkedin.com/in/karenfloresj · 🔗 https://github.com/kjpflores-cell
