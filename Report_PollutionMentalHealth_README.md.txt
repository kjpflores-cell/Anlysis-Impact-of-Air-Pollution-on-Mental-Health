The Impact of Air Pollution on Mental Health
By Karen J. Peralta Flores
September 01st, 2025

Project Overview
This report details a data analysis project focused on understanding the relationship between air pollution, sleep quality, and stress levels. The study is based on a small sample of 20 surveys collected in Barcelona, Spain, as part of the CitieS-Health project.

The analysis specifically focuses on nitrogen dioxide (NO2), a pollutant primarily emitted from vehicle exhaust and industrial processes. Exposure to this gas is a major public health concern, as it has been linked to respiratory issues and other health problems.

Project Objectives
My main objectives for this project were to:

Analyze the relationship between NO2​ pollution and self-reported health outcomes (sleep and stress).

Demonstrate my proficiency in R as a professional data analysis tool.

Create a fully reproducible report that can be easily shared and understood by others.

The Prepare Phase
This phase involved setting up the environment and getting the data ready for analysis. The dataset contained three key variables:

Stress: A self-reported stress score.

Sleep: The number of hours of sleep reported.

no2bcn_24h_x30: The 24-hour average concentration of NO2​.

The Process Phase
This was the most critical step, where I cleaned and transformed the data to ensure the reliability of the analysis. A key challenge was handling missing data (represented as NA). I made two different decisions based on the nature of the data:

Imputation for Sleep and Stress: For the missing values in the sleep and stress columns, I chose to fill the empty cells with the average (mean) value of each column. This imputation method allowed me to preserve the total number of observations, which is important for a small dataset.

Removal for NO2: For the no2bcn_24h_x30 values, I decided to remove the entire rows with missing data. This decision was crucial because the primary goal of the study is to evaluate the effect of NO2​ levels. Imputing these values could have introduced a significant bias and potentially skewed the results, compromising the integrity of my conclusions.

Finally, I created a new column, pollution_level, which classified each day as "High" or "Low" based on whether the NO2​ concentration was above or below the overall average.

Challenges and Solutions
During the analysis, I successfully encountered and resolved several common data challenges:

Tool Change: The initial analysis was performed in Google Sheets. However, I made the decision to migrate the project to R to demonstrate my programming skills and create a more reproducible and professional workflow.

Data Type Error: Initial attempts to create a scatter plot in Google Sheets resulted in an error because the NO2​ column was not recognized as a number. This was solved by ensuring the data was in the correct format.

Misleading Correlation: The initial scatter plot showed a misleading correlation that seemed to contradict intuition (higher pollution, more sleep). This was resolved by switching to a bar chart, which is more suitable for comparing group averages. This decision validated the importance of using the correct visualization to avoid misinterpretations.

Plot Type Error: The attempt to create a box plot was blocked by Google Sheets. The solution was to use a simple bar chart instead.

The Analyze & Share Phase
I performed the analysis by comparing the average sleep and stress levels between the "High" and "Low" pollution groups. The results were then visualized to make the findings easy to understand. While a scatter plot was initially misleading, the final bar charts provided a clear and compelling summary.

This report demonstrates a full data analysis lifecycle, from problem definition to data cleaning and final visualization, providing a clear answer to my initial question.

The Act Phase
The findings from this analysis show a clear correlation between pollution levels and sleep quality. This insight can be used to inform public health campaigns or to motivate further research with a larger, more robust dataset. For instance, these results could be shared with local health organizations in Barcelona to raise awareness about the potential effects of air pollution on daily life.

Visualización
Bibliography & Project Links
Data Source: CitieSHealth Project, provided by Barcelona Institute for Global Health (ISGlobal).

Enlace de datos: https://www.kaggle.com/datasets/thedevastator/air-pollution-and-mental-health?resource=download

Proyecto de Google Sheets (primera versión): https://docs.google.com/spreadsheets/d/1l04DSKw9kZwAJBKQGaKQeLCNJmh-RMRSU56GCbGP2Kw/edit?gid=506892392#gid=506892392