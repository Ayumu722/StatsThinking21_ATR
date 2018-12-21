library(NHANES)
library(dplyr)
library(magrittr)
library(pander)
library(tidyr)
library(ggplot2)
library(gridExtra)

NHANES %>%
  drop_na(SleepHrsNight) %>%
  dplyr::select(SleepHrsNight) %>%
  group_by(SleepHrsNight) %>%
  summarize(AbsoluteFrequency = n()) %>%
  mutate(
    RelativeFrequency = AbsoluteFrequency / sum(AbsoluteFrequency),
    Percentage = RelativeFrequency * 100
  ) %>% 
  pander()

p1 <- ggplot(NHANES,aes(x=SleepHrsNight))+geom_histogram(binwidth=1)
p2 <- ggplot(NHANES,aes(x=SleepHrsNight,y=..density..))+geom_histogram(binwidth=1)
grid.arrange(p1,p2,ncol=2)