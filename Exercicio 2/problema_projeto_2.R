library(ggplot2)
# ler o arquivo
data <- read.csv("https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/master.csv")
# dados filtrados de acordo com o enunciado
data_filtered <- subset(data, year == 1986 & age == "25-34 years")
# criar o gráfico 
p <- ggplot(data_filtered, aes(x = sex, y = suicides.100k.pop, fill = sex)) +
  geom_boxplot(color = "black", size = 0.7) +
  scale_fill_manual(values = c("male" = "#1f77b4", "female" = "#ff7f0e")) +
  labs(title = "Suicides per 100k Population in 1986 for Age Group 25-34",
       x = "Sex",
       y = "Suicides per 100k Population") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
        axis.title.x = element_text(face = "bold"),
        axis.title.y = element_text(face = "bold"))
print(p)