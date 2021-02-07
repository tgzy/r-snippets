library(dplyr)
library(ggplot2)

head(mpg)
df_dataset <- mpg
df_displ_avg_manufacturer <- df_dataset %>%
  select(manufacturer,
         displ) %>%
  group_by(manufacturer) %>%
  summarize(displ_avg = mean(displ,
                             na.rm=TRUE)
            )
                                                                              
df_dataset_enriched <- left_join(df_dataset, df_displ_avg_manufacturer, by="manufacturer")

#p <- df_dataset_enriched %>% ggplot(data=df_dataset_enriched, aes(x=cty, y=displ)) + barplot()
p <- df_dataset_enriched %>%
  ggplot(aes(y=cty,
             x=displ)) +
  geom_point(aes(size=class)) +
  facet_wrap(. ~ cyl,
             labeller = label_both) +
  scale_fill_brewer( palette = "Blues")
p

# dotplot
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# dotplot with smoothing
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

# dotplot with smoothing, coloring per drv
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color=drv)) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

# dotplot with smoothing and coloring per drv
ggplot(data = mpg, aes(color=drv)) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

# dotplot with smoothing and coloring per drv
ggplot(data = mpg, aes(color=drv)) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(. ~ class)

# filtering
ggplot(data = mpg, aes(color=drv)) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"),
              se = TRUE,
              mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color=manufacturer)) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))
