#import nba statistics (current NBA players)
vorpPast<-read.csv(file.choose(),header=TRUE)
#import nba statistics (2017 NBA prospects)
vorpCurrent<-read.csv(file.choose(),header=TRUE)

#libraries
library(ggplot2)
library(randomForest)
library(gbm)
library(plyr)
library(dplyr)

# find missing values in dataset 
vorpPast[!complete.cases(vorpPast),]
vorpPast1<-na.omit(vorpPast)
# build a random forest (trained on statistics of current NBA players)
rf1 <- randomForest(VORP~POS.x+Body.Fat..+Hand.Length+Hand.Width+Height.wo.shoes+Standing.Reach.Height.w.shoes+
                      Weight+Wingspan+Lane.Agiility+three.quarter.sprint+standing.vertical+max.vertical.leap+
                      Power+G+MP+FG+FGA+X2P+X2PA+X3P+X3PA+FT+FTA+TRB+
                      AST+STL+BLK+TOV+PF+PTS,ntree=2000, mtry = 13, do.trace=100,data=vorpPast)
varImpPlot(rf1)
#predict three year VORP for 2017 NBA prospects (trained on random forest model)
## down in the past
vorpPast$vorpRF<-predict(rf2,vorpPast,type="response")
#rank prospects by predicted VORP
rank<-subset(vorpPast,select=c(Player,VORP,vorpRF))
# mean squared error (random forest model) and variable importance 
mean((vorpPast$vorpRF-vorpPast$VORP)^2)
importance(rf1)

# gradient boosting model 
library(gbm)
gbm = gbm( VORP~Pos+Body.Fat..+Hand.Length+Hand.Width+Height.wo.shoes+Standing.Reach.Height.w.shoes+
             Weight+Wingspan+Lane.Agiility+three.quarter.sprint+standing.vertical+max.vertical.leap+
             +Power+G+MP+FG+FGA+X2P+X2PA+X3P+X3PA+FT+FTA+TRB+
             AST+STL+BLK+TOV+PF+PTS,vorpPast,
           n.trees=1000,
           shrinkage=0.01,
           distribution="gaussian",
           interaction.depth=7,
           bag.fraction=0.9,
           cv.fold=10,
           n.minobsinnode = 10
)
#predict three year VORP for 2017 NBA prospects (trained on gradient boosting model)
vorpCurrent$vorpGBM<-predict(gbm,vorpCurrent,type="response")
#mean squared error gradient boosting model
mean((vorpPast$vorpGBM-vorpPast$VORP)^2)
# Relationship between college free throw attempts and VORP 
qplot(vorpPast$FTA,vorpPast$VORP, geom='smooth', span =0.5)+xlab("Free Throw Attempts per Game")+
  ylab("VORP")+ggtitle("College Free Throw Attempts Lead to Early Success in the NBA")+theme(plot.title = element_text(hjust = 0.5))
cor.test(vorpPast$FTA,vorpPast$VORP)








