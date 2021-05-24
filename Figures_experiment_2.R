# reads data and plots figure 8 Kinateder & Cooper "Assessing effects of reduced vision on spatial orientation ability using Virtual Reality"

# load libraries for plotting
library(groundhog)
groundhog.library('tidyverse', '2021-05-19')
groundhog.library('gridExtra', '2021-05-19') # to use grid.arrange()

# clear work space and close all plots
rm(list = ls())

# read data
data = read.csv("data_experiment_2.csv",header=TRUE) 

# Fig 8a: Kappa
Fig8a <-  data %>%
  ggplot(aes(x = group, y = kappa_hat_mix, color = group))+
  geom_boxplot()+
  geom_jitter(width = 0.1)+
  facet_wrap( ~ condition) +
  theme(legend.position = 'none')

# Fig 8b: RT
Fig8b <- data %>%
  ggplot(aes(x = group, y = medianRT, color = group))+
  geom_boxplot()+
  geom_jitter(width = 0.1)+
  facet_wrap( ~ condition)+
  theme(legend.position = 'none')

Fig8 <- grid.arrange(Fig8a, Fig8b, nrow = 1) 

ggsave("Fig8.jpg", plot = Fig8)

