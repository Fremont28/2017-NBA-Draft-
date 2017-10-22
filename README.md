# 2017-NBA-Draft-

Introduction  

This year’s NBA draft is one of the deepest in a long time. This means that teams drafting in the mid to late first round have a decent shot at landing a future starter. 

Of course, players like Markelle Fultz, Lonzo Ball, and Josh Jackson will be swooped up early in the draft, but other players such as Lauri Markannen, Kadeem Allen, and Ike Anigbogu could also be high value selections. 
.
Aside from the first two picks in the draft, there is very little distinction between the value of picks three through ten according to the data journalism website Five Thirty Eight. For example, Ben Simmons, the top pick in 2016, hasn’t even suited up for the Philadelphia 76er’s due to injuries. Finding underrated prospects is difficult task and a healthy dose of luck. 

Using analytics can be useful in projecting the draft. While most players are evaluated more heavily through scouting, modeling can offer useful insights into a prospective draft pick’s future ability based on the metrics of current NBA players. 

Data and Methods 

The college and NBA data used in the model comes from four sources: Basketball Reference, Sports Reference, NBA.com, and Draft Express. Our primary goal is to project NBA prospects’ value above replacement (VORP) over their first three seasons in the league. 

The model is trained on 280 current NBA players drafted between 2000 through 2016. It is important to note that a small subset of players in the model were drafted in either 2015 or 2016. In turn, their first or summed second year VORP (for players drafted in 2015) was used to approximate a three-year VORP. International players were not included in the model. 

In addition, a small group of former draft picks did not partake in the NBA combine. We approximated these players’ physical features such as wingspan and vertical jump by taking a positional mean (i.e. point guard, small forward). Obviously, this allows for an element of bias in the model.


The Model

We tested several predictive models including random forest and linear regression, but found that the gradient boosting model had the lowest mean squared error (1.02  MSE compared to 1.32 MSE in the random forest model). Thirty-three variables were used to project college prospect’s three-year VORP based on their college shooting, rebounding, defense, and NBA combine metrics. 

According to the model, the most predictive variables for early NBA success (in terms of VORP) are steals, free throw attempts, assists, weight, and two-point field goal attempts per game. The player’s college position is also an important predictor of early career VORP. The least predictive variables in the model are the player’s wingspan, field goals per game, three pointers made per game, and whether he played in a power conference or not. 



