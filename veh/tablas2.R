f <- read.csv("data/Antiguedad_AP_Cba.csv")
head(f)
class(f$cilindrada)
f$cc <- ifelse(f$cilindrada <= 1.4, "<=1400", 
               ifelse(
                 f$cilindrada >1.4 & f$cilindrada <= 2, "1400_2000",
                 ">2000"
               ))
f$cc <- factor(x = f$cc, levels =c("<=1400", "1400_2000", ">2000"))
df <- aggregate(f$N, by =list(f$cc), length)
names(df) <- c("cc", "x")
df$per <- df$x /sum(df$x)
df
