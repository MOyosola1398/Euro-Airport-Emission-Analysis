install.packages("tidyverse")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("lubridate")
library(tidyverse)
library(ggplot2)
library(lubridate)
library(dplyr)
summary(dataem)
# Ensure the YEAR and MONTH columns are treated as numeric for analysis
dataem$YEAR <- as.numeric(dataem$YEAR)
dataem$MONTH <- as.numeric(dataem$MONTH)
# Convert YEAR and MONTH into a Date column
dataem$Date <- as.Date(paste(dataem$YEAR, dataem$MONTH, "01", sep="-"), format="%Y-%m-%d")
summary(dataem$CO2_TONS)
summary(dataem$NOX_KG)
summary(dataem$SOX_KG)
## TREND ANALYSIS FOR EMISSION OVER TIME

## Group by Year and month then find aggreate data
emission_trends<- dataem %>% 
  group_by(YEAR, MONTH) %>%
  summarize(total_CO2= sum(CO2_TONS, na.rm = TRUE), total_NOX= sum(NOX_KG, na.rm = TRUE), total_SOX= sum(SOX_KG, na.rm = TRUE))

# Plot trends over time
ggplot(emission_trends, aes(x = as.Date(paste(YEAR, MONTH, "01", sep="-")))) +
  geom_line(aes(y = total_CO2, color = "CO₂ Emissions")) +
  geom_line(aes(y = total_NOX, color = "NOₓ Emissions")) +
  geom_line(aes(y = total_SOX, color = "SOₓ Emissions")) +
  labs(title = "Emissions Trends Over Time", x = "Year", y = "Emissions (in tons and KG)") +
  theme_minimal() +
  scale_color_manual(values = c("blue", "red", "green"))


### EMISSION ANALYSIS BY FLIGHT PHASE 

emission_by_phase<- dataem %>% 
  group_by(FLIGHT_PHASE) %>%
  summarize(total_CO2= sum(CO2_TONS, na.rm = TRUE), total_NOX= sum(NOX_KG, na.rm = TRUE), total_SOX= sum(SOX_KG, na.rm = TRUE))
# Plot emissions by flight phase
ggplot(emission_by_phase, aes(x = FLIGHT_PHASE)) +
  geom_bar(aes(y = total_CO2, fill = "CO2 Emissions"), stat = "identity", position = "dodge") +
  geom_bar(aes(y = total_NOX, fill = "NOx Emissions"), stat = "identity", position = "dodge") +
  geom_bar(aes(y = total_SOX, fill = "SOx Emissions"), stat = "identity", position = "dodge") +
  labs(title = "Emissions by Flight Phase", x = "Flight Phase", y = "Emissions (in tons & KG)") +
  theme_minimal() +
  scale_fill_manual(values = c("blue", "red", "green"))

### EMISSION BY FLIGHT AREA AND TYPE

# Aggregate emissions by AREA and FLIGHT_TYPE
emissions_by_area_flight_type <- dataem %>%
  group_by(AREA, FLIGHT_TYPE) %>%
  summarize(
    total_CO2 = sum(CO2_TONS, na.rm = TRUE),
    total_NOX = sum(NOX_KG, na.rm = TRUE),
    total_SOX = sum(SOX_KG, na.rm = TRUE)
  )

# Plot emissions by area and flight type
ggplot(emissions_by_area_flight_type, aes(x = AREA, fill = FLIGHT_TYPE)) +
  geom_bar(aes(y = total_CO2), stat = "identity", position = "dodge") +
  geom_bar(aes(y = total_NOX), stat = "identity", position = "dodge") +
  geom_bar(aes(y = total_SOX), stat = "identity", position = "dodge") +
  labs(title = "Emissions by Area and Flight Type", x = "Area", y = "Emissions (in tons)") +
  theme_minimal() +
  scale_fill_manual(values = c("blue", "red", "green", "yellow"))


##Comparative Analysis of Market Segments
##Evaluate and compare emissions across different market segments (e.g., business, cargo, low-cost, etc.).

# Aggregate emissions by MARKET_SEGMENT
emissions_by_segment <- dataem %>%
  group_by(MARKET_SEGMENT) %>%
  summarize(
    total_CO2 = sum(CO2_TONS, na.rm = TRUE),
    total_NOX = sum(NOX_KG, na.rm = TRUE),
    total_SOX = sum(SOX_KG, na.rm = TRUE)
  )

# Plot emissions by market segment
ggplot(emissions_by_segment, aes(x = MARKET_SEGMENT)) +
  geom_bar(aes(y = total_CO2, fill = "CO₂ Emissions"), stat = "identity", position = "dodge") +
  geom_bar(aes(y = total_NOX, fill = "NOₓ Emissions"), stat = "identity", position = "dodge") +
  geom_bar(aes(y = total_SOX, fill = "SOₓ Emissions"), stat = "identity", position = "dodge") +
  labs(title = "Emissions by Market Segment", x = "Market Segment", y = "Emissions (in tons)") +
  theme_minimal() +
  scale_fill_manual(values = c("blue", "red", "green"))
install.packages("gridExtra")
library(gridExtra)

### emission over time by FLIGT TIME AND AREA
# First plot
plot1 <- ggplot(dataem, aes(x = YEAR, y = CO2_TONS, color = AREA, linetype = FLIGHT_TYPE)) +
  geom_line() +
  labs(title = 'CO₂ Emissions over Time (Plot 1)', x = 'Year', y = 'CO₂ Emissions (Tons)')

# Second plot
plot2 <- ggplot(dataem, aes(x = YEAR, y = NOX_KG, color = AREA, linetype = FLIGHT_TYPE)) +
  geom_line() +
  labs(title = 'NOX Emissions over Time (Plot 2)', x = 'Year', y = 'NOX Emissions (Tons)')

# Third plot
plot3 <- ggplot(dataem, aes(x = YEAR, y = SOX_KG, color = AREA, linetype = FLIGHT_TYPE)) +
  geom_line() +
  labs(title = 'SOX Emissions over Time (Plot 3)', x = 'Year', y = 'SOX Emissions (Tons)')

# Arrange all plots in a 2x2 grid
grid.arrange(plot1, plot2, plot3, ncol = 1, nrow = 3)
