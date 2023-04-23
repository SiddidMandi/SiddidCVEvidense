install.packages(c("knitr","xfun","evaluate","highr"), lib="/home/siddid/Rpackages")
install.packages(c("ggplot2"), lib="/home/siddid/Rpackages")
.libPaths("/home/siddid/Rpackages")
library("xfun")
library("highr")
library("evaluate")
library("knitr")
library("ggplot2")

ddf <- read.csv("Group 5 Film Data.csv")
#hello from the tty port
ddf
head(ddf)

table(ddf$MPAA.Rating)
59 +       33        +63       +156      + 315      + 473

sum(ddf$Worldwide.Gross==0)
sum(ddf$Domestic.Gross==0)

plot(ddf$Production.Budget)

nrow(ddf)
#number of points is 1099
# $Title=categoricalNom, $Production.Bud=NumericalContinuous, $Worldwide.gross=NumericalContinuous $Domestic.Gross=NumericalContinuous
# $Release=NumericalDiscrete $CPI=NumericalContinuous
# $Duration=NumericalContinuous $MPAA.Rating=CateroricalOrdinal 
# 


#the varibale my team chooses is: Production.Budget, it is a
#NumericalContinuous variable and summary calculations will be meaningful
#on it.
summary(ddf$Production.Budget)
animation_df<- subset(ddf, Genre=="Animation")
summary(animationFilms$Production.Budget)
# Create a list of the production budgets for both data frames
budgets <- list(ddf$jus_Budget, animation_df$ajus_Budget)

# Create the boxplot with both data frames
boxplot(budgets, names=c("All Genres", "Animation"), 
        ylab="Production Budget", main="Boxplot of Production Budget by Genre")


png("Genres.png")
ggplot(ddf, aes(x = Genre, y = Production.Budget)) +
  geom_boxplot() +
  labs(title = "Boxplot of Duration by Genre", x = "Genre", y = "Duration")
  theme(axis.text.x = element <- text(angle = 90, hjust = 1))
dev.off()


png("BudgerHisto.png")
hist(ddf$Production.Budget,
	main="Production Budgets",
	xlab="Dollas",
	ylab="Frequency",
	breaks=50
)
dev.off()
16000000  -30052955
#     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
#    1400   5000000  16000000  30052955  40000000 300000000 


# Profit or not
ddf$Profit <- ifelse(ddf$Worldwide.Gros/(3*ddf$Production.Budget) > 1, TRUE,FALSE )
table(ddf$Profit)
#1033 profit,   66nprofit

contiTable <- table(ddf$Profit, ddf$Big.Budget)
contiTable
11/(11+15)
15/(11+15)
chisq.test(contiTable)


# question 3: Big-Budget category
latest_cpi <- 294.4
ddf$ajus_budget  <- ddf$Production.Budget * (latest_cpi / ddf$CPI)
ddf$ajus_budget
#200 * 10^6
ddf$Big.Budget <- ifelse(ddf$ajus_budget > 200000000, TRUE, FALSE)
ddf$Big.Budget
totalBigg <- sum(ddf$Big.Budget == "Bigg") 
totalBigg <- which(ddf$Big.Budget == "Bigg")
table(ddf$Big.Budget) #32 big budgets, and 1044 smols

ddf$Release2 <- as.Date(ddf$Release, format = "%d/%m/%Y")
#ddf$weekend <- ifelse(weekdays(ddf$Release2)=="Saturday" | weekdays(ddf$Release2)=="Sunday" | weekdays(ddf$Release2)=="Friday", TRUE, FALSE)
ddf$weekend <- ifelse(weekdays(ddf$Release2)=="Saturday" | weekdays(ddf$Release2)=="Sunday", TRUE, FALSE)
ddf$releaseWeekdays <- weekdays(ddf$Release2) #works
#sum(ddf$releaseWeekdays=="Sunday")
ddf$weekend <- ifelse(weekdays(ddf$Release2)=="Saturday" | weekdays(ddf$Release2)=="Sunday" | weekdays(ddf$Release2)=="Friday", TRUE, FALSE)
ddf$weekend
table(ddf$weekend)

weekdays(2020-01-01)

contiTable <- table(ddf$weekend, ddf$Big.Budget)
contiTable

chisq.test(contiTable)

#there is an association between Big Budget and Weekend release, meaning


#Section 2: exploration:
#question 4
table(ddf$Genre)
#converting duration to mins only

# Extract hours and minutes from the Duration column
unique(ddf$Duration)
# Replace missing hours with "0h" and missing minutes with "0m"
ddf$Duration <- gsub("^$", "0h 0m", ddf$Duration)
# Extract hours and minutes separately
hours <- as.numeric(gsub("(\\d+)h.*", "\\1", ddf$Duration))
minutes <- as.numeric(gsub(".*\\s(\\d+)m", "\\1", ddf$Duration))
# Calculate total duration in minutes
ddf$total_duration <- hours * 60 + minutes
sum(is.na(ddf$total_duration))

png("AllPlots.png")
ggplot(ddf, aes(x = Genre, y = total_duration)) +
  geom_boxplot() +
  labs(title = "Boxplot of Duration by Genre", x = "Genre", y = "Duration")
  theme(axis.text.x = element <- text(angle = 90, hjust = 1))
dev.off()


############################
#question 5
head(ddf)
head(ddf$Release)
ddf$Release2 <- as.Date(ddf$Release, format = "%d/%m/%Y")
ddf$weekend <- ifelse(weekdays(ddf$Release2)=="Saturday" | weekdays(ddf$Release2)=="Sunday" | weekdays(ddf$Release2)=="Friday", TRUE, FALSE)
ddf$weekend

cor(ddf$Release,ddf$Production.Budget)

ddf$editRelease <- as.numeric(difftime(ddf$Release2, as.Date("2000-01-01"), units = "days"))
ddf$editRelease

subset(ddf, format(Release, "%Y") >= "2002" & format(Release, "%Y") <= "2004")

dev.new()
dev.off()
plot(ddf$Worldwide.Gross)

png("ExpensiveOverTime.png")
plot(ddf$editRelease, ddf$Production.Budget)
dev.off()

fit <- lm(Production.Budget ~ Release, data=ddf)
coef(fit)
cor(na.omit(ddf$Production.Budget), na.omit(ddf$editRelease))

#association between Bigg and Profit, 
#profit = Production.Budget -Worldwide.Gros$Total_Scores

ddf$profit <- ddf$Worldwide.Gross - (ddf$Production.Budget*3)
noProfit <- subset(ddf, profit <= 0)
noProfit
profit <- subset(ddf, profit > 0)
profitGBig  <- subset(ddf, profit > 0 & Big.Budget == "Bigg")
profitNGBig  <- subset(ddf, profit > 0 & Big.Budget == "smol")
nrow(profitGBig) # 28
nrow(profitNGBig) # 668
nrow(ddf)      #1099

28/1099 - 668/1099 #or
9/1099 - 350/1099
#rate(profit | Bigg) < rate(profit | notBig)
#negative association between BigBudget and Profit

#question 7
latest_cpi <- 294.4
ddf$ajus_budget  <- ddf$Production.Budget * (latest_cpi / ddf$CPI)
ddf$ajus_budget
ddf$ajus_wwgross  <- ddf$Worldwide.Gross * (latest_cpi / ddf$CPI)
ddf$ajus_wwgross

dev.off()
dev.new()
plot(ddf$ajus_budget, ddf$ajus_wwgross)

cor(na.omit(ddf$ajus_budget), na.omit(ddf$ajus_wwgross)) # 0.58

## 7b
table(ddf$MPAA.Rating)

mpaaG <- ddf[which(ddf$MPAA.Rating=="G"),] #stirngs req ''
latest_cpi <- 260
mpaaG$ajus_budget  <- mpaaG$Production.Budget * (latest_cpi / mpaaG$CPI)
mpaaG$ajus_budget
mpaaG$ajus_wwgross  <- mpaaG$Worldwide.Gross * (latest_cpi / mpaaG$CPI)
mpaaG$ajus_wwgross

cor(na.omit(mpaaG$ajus_budget), na.omit(mpaaG$ajus_wwgross)) # 0.5209065

mpaaNR <- ddf[which(ddf$MPAA.Rating=="Not Rated"),] #stirngs req ''
latest_cpi <- 260
mpaaNR$ajus_budget  <- mpaaNR$Production.Budget * (latest_cpi / mpaaNR$CPI)
mpaaNR$ajus_budget
mpaaNR$ajus_wwgross  <- mpaaNR$Worldwide.Gross * (latest_cpi / mpaaNR$CPI)
mpaaNR$ajus_wwgross

cor(na.omit(mpaaNR$ajus_budget), na.omit(mpaaNR$ajus_wwgross)) # 0.5290336

mpaaPG13 <- ddf[which(ddf$MPAA.Rating=="PG"),] #stirngs req ''
latest_cpi <- 260
mpaaPG$ajus_budget  <- mpaaPG$Production.Budget * (latest_cpi / mpaaPG$CPI)
mpaaPG$ajus_budget
mpaaPG$ajus_wwgross  <- mpaaPG$Worldwide.Gross * (latest_cpi / mpaaPG$CPI)
mpaaPG$ajus_wwgross

cor(na.omit(mpaaPG$ajus_budget), na.omit(mpaaPG$ajus_wwgross)) #0.3492735

mpaaPG13 <- ddf[which(ddf$MPAA.Rating=="PG-13"),] #stirngs req ''
latest_cpi <- 260
mpaaPG13$ajus_budget  <- mpaaPG13$Production.Budget * (latest_cpi / mpaaPG13$CPI)
mpaaPG13$ajus_budget
mpaaPG13$ajus_wwgross  <- mpaaPG13$Worldwide.Gross * (latest_cpi / mpaaPG13$CPI)
mpaaPG13$ajus_wwgross

cor(na.omit(mpaaPG13$ajus_budget), na.omit(mpaaPG13$ajus_wwgross)) # 0.6773944

mpaaR <- ddf[which(ddf$MPAA.Rating=="R"),] #stirngs req ''
mpaaR
latest_cpi <- 260
mpaaR$ajus_budget  <- mpaaR$Production.Budget * (latest_cpi / mpaaR$CPI)
mpaaR$ajus_budget
mpaaR$ajus_wwgross  <- mpaaR$Worldwide.Gross * (latest_cpi / mpaaR$CPI)
mpaaR$ajus_wwgross

cor(na.omit(mpaaR$ajus_budget), na.omit(mpaaR$ajus_wwgross)) # 0.4807221

#part c, conclusion
# using production budget to predict wwgross is a resonable idea. There
# always exists a correlation between the 2, it is often strong when split
# into categories and strong overall, 0.58
#do a chi squared test
# null hypothesis, there is no association between family movies and
# profit.

# Question 9, extra analysis
head(ddf)
ddf$Family <- ifelse(ddf$MPAA.Rating %in% c("PG", "PG-13", "G"), TRUE, FALSE)
table(ddf$Family, ddf$Genre)
ddf$Animation <- ifelse(ddf$Genre=="Animation", TRUE, FALSE)
contiTable <- table(ddf$Animation, ddf$Family)
contiTable
chisq.test(contiTable)



#Question 10
head(ddf)
ddf$Family <- ifelse(ddf$MPAA.Rating %in% c("PG", "PG-13", "G"), TRUE, FALSE)
table(ddf$Family)
ddf$Profit <- ifelse(ddf$Worldwide.Gros/(3*ddf$Production.Budget) > 1, TRUE, FALSE )
table(ddf$Profit)

contiTable <- table(ddf$Family, ddf$Profit)
contiTable

chiTest  <- chisq.test(contiTable)
chiTest

ddf$Family <- ifelse(ddf$MPAA.Rating %in% c("PG", "PG-13", "G"), "Profit", "NOprofit")
table(ddf$Family)
ddf$Profit <- ifelse(ddf$Worldwide.Gros/(3*ddf$Production.Budget) > 0, "Family", "Adult")
table(ddf$Profit)
contiTable <- table(ddf$Family, ddf$Profit)
contiTable
chiTest  <- chisq.test(contiTable)
chiTest

