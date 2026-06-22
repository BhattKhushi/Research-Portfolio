library(tidyverse)

# Load outputs
combined <- read_csv("outputs/enrollment_forecast.csv")
race_trend <- read_csv("outputs/enrollment_by_race.csv")
gender_trend <- read_csv("outputs/enrollment_by_gender.csv")

# Chart 1: National enrollment trend with forecast
ggplot(combined, aes(x = year, y = forecast, color = type)) +
  geom_line(size = 1.2) +
  geom_ribbon(aes(ymin = lower_95, ymax = upper_95), alpha = 0.15, fill = "steelblue", color = NA) +
  geom_ribbon(aes(ymin = lower_80, ymax = upper_80), alpha = 0.25, fill = "steelblue", color = NA) +
  scale_y_continuous(labels = scales::comma) +
  scale_color_manual(values = c("Historical" = "steelblue", "Forecast" = "darkorange")) +
  labs(title = "National Undergraduate Enrollment with ARIMA Forecast",
       x = "Year", y = "Total Enrollment", color = "") +
  theme_minimal()

ggsave("outputs/chart1_national_forecast.png", width = 10, height = 6)

# Chart 2: Enrollment by race/ethnicity over time
ggplot(race_trend, aes(x = year, y = enrollment, color = group)) +
  geom_line(linewidth = 1.2) +
  scale_y_continuous(labels = scales::comma) +
  labs(title = "Undergraduate Enrollment by Race/Ethnicity 2014-2024",
       x = "Year", y = "Total Enrollment", color = "Group") +
  theme_minimal()

ggsave("outputs/chart2_enrollment_by_race.png", width = 10, height = 6)

# Chart 3: Enrollment by gender over time
ggplot(gender_trend, aes(x = year, y = enrollment, color = group)) +
  geom_line(linewidth = 1.2) +
  scale_y_continuous(labels = scales::comma) +
  scale_color_manual(values = c("male" = "steelblue", "female" = "darkorange")) +
  labs(title = "Undergraduate Enrollment by Gender 2014-2024",
       x = "Year", y = "Total Enrollment", color = "Gender") +
  theme_minimal()

ggsave("outputs/chart3_enrollment_by_gender.png", width = 10, height = 6)