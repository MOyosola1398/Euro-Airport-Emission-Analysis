# Euro-Airport-Emission-Analysis
Emission analysis for Euro from 2019-2024
Libraries Used
The following R libraries are utilized for this analysis:

tidyverse: A collection of packages for data manipulation, exploration, and visualization.

ggplot2: Used for creating high-quality plots.

dplyr: For data manipulation and summarization.

lubridate: To handle and manipulate date-time data.

gridExtra: Used for arranging multiple plots in a grid.

Data Preprocessing
The dataset includes emissions data for multiple variables, including CO₂ emissions (in tons), NOₓ emissions (in kg), and SOₓ emissions (in kg).

The YEAR and MONTH columns were converted into a Date column for better time series analysis.

Emissions were aggregated by YEAR and MONTH to summarize the data.

Analysis
Trend Analysis for Emissions Over Time

The total emissions of CO₂, NOₓ, and SOₓ over time (by year and month) are visualized using line plots.

The data is grouped by year and month, then aggregated to get the total emissions for each month.

Emissions by Flight Phase

Emissions are aggregated by FLIGHT_PHASE (e.g., cruise, landing, take-off) to identify how emissions vary at different stages of a flight.

A bar plot is created to visualize emissions for each flight phase.

Emissions by Flight Area and Type

Emissions data is aggregated by AREA and FLIGHT_TYPE, with a grouped bar plot created to visualize emissions by these categories.

Comparative Analysis of Market Segments

A comparison of emissions across various market segments (e.g., business, cargo, low-cost, mainline, etc.) is performed.

The emissions for each segment are visualized using a bar plot.

Multiple Plots for Emission Over Time by Flight Area and Type

Emission trends for CO₂, NOₓ, and SOₓ are plotted separately for different AREA and FLIGHT_TYPE categories.

These plots are arranged in a 2x2 grid for better comparison.

Plots
1. Emissions Trends Over Time
This plot shows how emissions of CO₂, NOₓ, and SOₓ have changed over time.


2. Emissions by Flight Phase
This plot shows the breakdown of emissions by different flight phases (e.g., cruise, landing, take-off).


3. Emissions by Flight Area and Type
This plot shows the emissions breakdown by different flight areas and types.


4. Emissions by Market Segment
This plot shows emissions by market segment, such as business, cargo, and low-cost.


5. Comparative Emission Plots by Flight Area and Type
These plots compare emissions by AREA and FLIGHT_TYPE for CO₂, NOₓ, and SOₓ over time.


Conclusion
This repository provides a comprehensive analysis of emissions data for flights, allowing insights into how emissions vary by time, flight phase, area, type, and market segment. The plots generated serve as an effective tool for understanding trends and making informed decisions related to emission reductions and policy-making.

Notes:
Ensure that your dataset (dataem) is in the correct format and contains the necessary columns (YEAR, MONTH, CO2_TONS, NOX_KG, SOX_KG, FLIGHT_PHASE, AREA, FLIGHT_TYPE, MARKET_SEGMENT).

Replace the placeholder for plot images in the README with the appropriate image links in your repository.
