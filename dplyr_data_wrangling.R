library(tidyverse)
# https://www.datanovia.com/en/lessons/subset-data-frame-rows-in-r/

df_iris <- as_tibble(iris)

## Auswahl von Spalten
df_iris_choice <- df_iris %>% select(one_of(c("Sepal.Length", "Petal.Length")))
df_iris_choice2 <- df_iris %>% select_if(is.factor)
test <- df_iris %>% mutate(Sepal.Length.character = as.integer(round(Sepal.Length, digits=0)))

## Auswahl von Zeilen

### Einzigartig
df_iris_species <- df_iris %>% select(Species) %>% unique()
df_iris_species
df_iris_species2 <- df_iris %>% distinct(Species, .keep_all = TRUE)
df_iris_species2
df_iris_species_vector <- df_iris %>% group_by(Species) %>% distinct(Species) %>% pull() #%>% as.factor()
df_iris_species_vector

### Zeilenanzahl
df_iris_sliced <- df_iris %>% slice(1:2)
df_iris_sliced
df_iris_sample_n <- df_iris %>% sample_n(5, replace = FALSE)
df_iris_sample_n
df_iris_sample_percentage <- df_iris %>% sample_frac(0.05, replace = FALSE)
df_iris_sample_percentage

# Renaming
colnames(df_iris)

names(df_iris)[names(df_iris) == "Petal.Length"] <- "Blatt.Laenge"
names(df_iris)[4] <- "Blatt.Breite"
df_iris

# Data handling
df_iris_numeric <- df_iris %>% select(-Species)
df_iris_mutated <- df_iris_numeric %>% mutate_if(is.numeric, round, digits = 0)
df_iris_mutated
df_iris_mutated2 <- df_iris_numeric %>% mutate_at(c("Sepal.Length", "Petal.Width"), ~funs(cm = ./2.54))
df_iris_mutated2
df_iris_mutated3 <- df_iris_numeric %>% summarise_if(is.numeric, mean, na.rm = TRUE)
df_iris_mutated3
#df_iris_mutated4 <- df_iris_numeric %>% mutate_if(is.numeric) %>% summarize(mean_sep = mean(Sepal.Length, na.rm = TRUE))
df_iris_mutated4
