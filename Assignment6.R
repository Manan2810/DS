library(dplyr)
library(readr)

#PART-1
gm <- read.csv("https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv")


#ques 1. How many unique countries are represented per continent?
ans1=gm %>% 
  group_by(continent)%>%
  summarise(unique=n_distinct(country))

#ques 2. Which European nation had the lowest GDP per capita in a given year?
ans2 <- gm %>%
  filter(continent == "Europe") %>%
  group_by(year) %>%
  filter(gdpPercap == min(gdpPercap)) %>%
  select(year, country, gdpPercap)

#ques 3. According to the data available, what was the average life expectancy across each continent in a
#given year?
ans3=gm %>%
  group_by(continent,year) %>%
  summarise(life_expectancy=mean(lifeExp))

#ques 4. What 5 countries have the highest total GDP over all years combined?
ans4 <- gm %>%
  group_by(country) %>%
  summarise(TotalGDP = sum(gdpPercap)) %>%
  arrange(desc(TotalGDP)) %>%
  head(5)
#ques 5. What countries and years had life expectancies of at least 80 years?
ans5 = gm %>%
  group_by(country,year)%>%
  filter(lifeExp>=80.0)
#ques 6. What 10 countries have the strongest correlation (in either direction) between life expectancy and
#per capita GDP?
ans6=gm %>%
  group_by(country)%>%
  summarise(correlation=cor(lifeExp,gdpPercap))%>%
  arrange(desc(correlation))%>%
  head(10)

#ques 7. Which combinations of continent (besides Asia) and year have the highest average population
#across all countries?
ans7=gm %>%
  filter(continent!="Asia") %>%
  group_by(continent,year)%>%
  summarise(highestPop=mean(pop))%>%
  arrange(desc(highestPop))%>%
  head(1)
#ques 8. Which three countries have had the most consistent population estimates (i.e. lowest standard
#                                                                              deviation) across the years of available data?

ans8=gm%>%
  group_by(country)%>%
  summarise(mostconsistent=sd(pop))%>%
  arrange(mostconsistent)%>%
  head(3)
ans8

  
#ques 9. Excluding records from a given year, which observations indicate that the population of a country
#has decreased from the previous year and the life expectancy has increased?
ans9 <- gm %>%
  arrange(country, year) %>%
  filter(pop < lag(pop) & lifeExp > lag(lifeExp))
ans9

#PART2
medicine_data <- data.frame(
  MedID = 1:10,
  Med_Name = c("MedicineA", "MedicineB", "MedicineC", "MedicineD", "MedicineE",
               "MedicineF", "MedicineG", "MedicineH", "MedicineI", "MedicineJ"),
  Company = c("CompanyA", "CompanyB", "CompanyC", "CompanyD", "CompanyE",
              "CompanyF", "CompanyG", "CompanyH", "CompanyI", "CompanyJ"),
  Manf_year = c(2020, 2021, 2022, 2019, 2023, 2020, 2022, 2021, 2023, 2018),
  Exp_date = c("2024-01-01", "2023-12-31", "2025-02-28", "2024-03-15", "2024-11-30",
               "2025-06-30", "2023-09-10", "2024-07-20", "2025-04-05", "2023-11-15"),
  Quantity_in_stock = c(100, 150, 200, 120, 80, 300, 180, 250, 90, 160),
  Sales = c(50, 30, 80, 60, 20, 120, 40, 70, 10, 90)
)

#ques1 Read the data file and show the first 4 records:
head(medicine_data,n=4)
#ques2 Read the data file and show the last 4 records
tail(medicine_data,n=4)
#ques3 Find the correlation between Quantity_in_stock and Exp_date
correlation_value <- cor(medicine_data$Quantity_in_stock, as.numeric(medicine_data$Exp_date))
#ques4 Plot bar graph
barplot(medicine_data$Sales, names.arg = medicine_data$Manf_year, xlab = "Year of Manufacturing", ylab = "Sales", col = "blue")
#ques5 Find the company with more than one type of medicine
multiple_meds_company <- medicine_data %>%
  group_by(Company) %>%
  filter(n() > 1) %>%
  distinct(Company)
#ques6 Find the types of medicine available
available_meds <- unique(medicine_data$Med_Name)
#ques7 
boxplot(medicine_data$Exp_date ~ medicine_data$Med_Name, xlab = "Medicine", ylab = "Expiry Date")
#ques8 Calculate average stock
avg_stock <- mean(medicine_data$Quantity_in_stock)

#ques9 Draw regression line
ans9=na.omit(medicine_data[c("Manf_year", "Sales")])
plot(ans9$Manf_year, ans9$Sales, main = "Regression Line: Manufacturing Year vs Sales", xlab = "Manufacturing Year", ylab = "Sales", col = "blue")
abline(lm(ans9$Sales ~ ans9$Manf_year), col = "red")



