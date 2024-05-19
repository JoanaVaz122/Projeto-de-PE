library(ggplot2)

# Dados do link do enunciado
dados <- read.csv("https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/Paises_PIB_ICH.csv")

# Selecionar os países da Ásia e África
dados_selecionados <- subset(dados, Continent %in% c("Asia", "Africa"))

# Símbolo especial para os países
dados_selecionados$SpecialSymbol <- ifelse(dados_selecionados$Country %in% c("United Arab Emirates", "Nepal", "Comoros", "Namibia"), "selected_country", "other_countries")

# Criar o gráfico
p <- ggplot(dados_selecionados, aes(x = log(GDP), y = HCI, color = Continent)) +
  geom_point(aes(shape = SpecialSymbol, fill = Continent, size = SpecialSymbol), color = "black") +
  scale_shape_manual(values = c("selected_country" = 24, "other_countries" = 21)) +
  scale_size_manual(values = c("selected_country" = 5, "other_countries" = 3)) +
  scale_fill_manual(values = c("Asia" = "red", "Africa" = "blue")) +
  geom_text(aes(label = ifelse(SpecialSymbol == "selected_country", Country, "")), size = 3, nudge_y = 0.15, color = "black", show.legend = FALSE) +
  labs(x = "Log(GDP per capita)", y = "HCI", color = "Continent", fill = "Continent") +
  guides(shape = FALSE, size = FALSE) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
        axis.title = element_text(face = "bold"),
        legend.position = "right")

print(p)
