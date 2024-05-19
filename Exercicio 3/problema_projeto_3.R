library(readxl)
library(ggplot2)

data_excel <- readxl::read_xlsx("C:/Users/jocat/OneDrive/Ambiente de Trabalho/PE/Projeto de PE exercicios/Exercicio 3/electricity.xlsx")

data <- subset(data_excel, YEAR >= 2015 & COUNTRY %in% c("IEA Total", "Hungary", "Iceland") & PRODUCT == "Renewables")

data$share <- as.numeric(data$share)

data$DATE <- as.Date(paste(data$YEAR, data$MONTH, '01', sep="-"))

data$renewable100 <- data$share * 100

p <- ggplot(data, aes(x = DATE, y = renewable100, color = COUNTRY)) +
  geom_line(size = 1.5) +
  labs(title = "Evolution since 2015", x = "Year", y = "Percentage Renewables") +
  ylim(0, 100) +
  theme_minimal()

print(p)
