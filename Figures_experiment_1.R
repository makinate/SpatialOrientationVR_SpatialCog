# reads data and plots figure 5, 6 and 7 of Kinateder & Cooper "Assessing effects of reduced vision on spatial orientation ability using Virtual Reality"

# load libraries for plotting
# Note: This code was written on 2021-05-19; in case, libraries are not loading properly use the groundhog package to load the library versions from that time.
#library(groundhog)
#groundhog.library('tidyverse', '2021-05-19')
#groundhog.library('gridExtra', '2021-05-19') # to use grid.arrange()
library(tidyverse)
library(gridExtra) # to use grid.arrange()

# clear work space and close all plots
rm(list = ls())

# read data
data = read.csv("data_experiment_1.csv",header=TRUE) 

#### Figure 5
Data_Fig5 <- data %>% filter(condition == 'Square.Room' | condition == 'Rect.Room')

# Fig 5a: Kappa
Fig5a <-  Data_Fig5 %>%
  ggplot(aes(x = group, y = kappa_hat_geo, color = group))+
  geom_boxplot()+
  geom_jitter(width = 0.1)+
  facet_wrap( ~ condition) +
  theme(legend.position = 'none')

# Fig 5b: RT
Fig5b <- Data_Fig5 %>%
  ggplot(aes(x = group, y = medianRT, color = group))+
  geom_boxplot()+
  geom_jitter(width = 0.1)+
  facet_wrap( ~ condition)+
  theme(legend.position = 'none')

Fig5 <- grid.arrange(Fig5a, Fig5b, nrow = 1) 

ggsave("Fig5.jpg", plot = Fig5)

#### Figure 6
Data_Fig6 <- data %>% filter(condition == 'Square.Room + blue wall' | condition == 'Rect.Room + blue wall'| condition == 'Rect.room + conflict')

# Fig 6a: Kappa
Fig6a <-  Data_Fig6 %>%
  ggplot(aes(x = group, y = kappa_hat_mix, color = group))+
  geom_boxplot()+
  geom_jitter(width = 0.1)+
  facet_wrap( ~ condition) +
  theme(legend.position = 'none')

# Fig 5b: RT
Fig6b <- Data_Fig6 %>%
  ggplot(aes(x = group, y = medianRT, color = group))+
  geom_boxplot()+
  geom_jitter(width = 0.1)+
  facet_wrap( ~ condition)+
  theme(legend.position = 'none')

Fig6 <- grid.arrange(Fig6a, Fig6b, nrow = 1) 

ggsave("Fig6.jpg", plot = Fig6)

### Figure 7
Data_Fig7 <- Data_Fig6

# Fig 7: Feature weights
Fig7 <-  Data_Fig7 %>%
  ggplot(aes(x = group, y = weight_feature, color = group))+
  geom_boxplot()+
  geom_jitter(width = 0.1)+
  facet_wrap( ~ condition)+
  theme(legend.position = 'none')

print(Fig7)

ggsave("Fig7.jpg", plot = Fig7)

