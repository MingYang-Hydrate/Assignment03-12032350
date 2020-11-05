# Set working dir
setwd("D:/Assignment/R_Assignment03")
# Load the libraries
library(tidyr)
library(dplyr)
library(ggplot2)

# Read csv
Bone_data <- read.csv("Bone_Oxygen.csv", header=T)  #�����Ѿ��ֶ����뵽csv�ļ��У�����csv�ļ�
data      <- as_tibble(Bone_data)

data                 %>%
  group_by(BONE)     %>%                            #�Թ�ͷ���;���
  ggplot(aes(x = BONE, y = OXYGEN, fill = BONE)) +
  geom_boxplot() +
  ylim(10,13)  +
  ylab("Oxygen isotopic composition") +
  theme_classic()

anova_one_way <- aov(OXYGEN ~ BONE, data = data)
summary(anova_one_way)
TukeyHSD(anova_one_way)
#��99.9%�ĸ�����Ϊ��Щ��ͷ����ͬһ�¶����γɵģ����������ں��¶���