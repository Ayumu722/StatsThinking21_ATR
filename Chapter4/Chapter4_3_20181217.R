library(NHANES)
library(dplyr)
library(magrittr)
library(pander)
library(tidyr)
library(ggplot2)
library(gridExtra)

SleepHrsNight_cumulative <- 
  NHANES %>%
  drop_na(SleepHrsNight) %>%
  dplyr::select(SleepHrsNight) %>%
  group_by(SleepHrsNight) %>%
  summarize(AbsoluteFrequency = n()) %>%
  mutate(CumulativeFrequency = cumsum(AbsoluteFrequency))

pander(SleepHrsNight_cumulative)

SleepHrsNight_cumulative

p1 <- ggplot(SleepHrsNight_cumulative,aes(x=SleepHrsNight,y=CumulativeFrequency))+geom_line(size=2,color="blue")
p1 <- geom_line(data = SleepHrsNight_cumulative,aes(x=SleepHrsNight,y=AbsoluteFrequency))
grid.arrange(p1,p2,ncol=2)