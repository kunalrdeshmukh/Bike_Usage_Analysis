
data1307 <- read.csv(file="Data/2013-07 - Citi Bike trip data.csv", header=TRUE, sep=",")

data  = data1307 

print(head(data,2))
print("Printed head")
print(summary(data))


#counts <- table(data$gender)
#barplot(counts, main="Gender Distribution", 
#  	xlab="Gender")
#print("Printed gender distribution plot")

#counts <- table(data$birth.year)
#barplot(counts, main="Birth Year Distribution", 
#  	xlab="Birth Year")

#counts <- table(data$tripduration)
#barplot(counts, main="distribution of trip duration", 
#  	xlab="Trip duration")

#apply(data, 2, function(x) any(is.na(x)))

#max(unique(c(data$start.station.id , data$end.station.name )))

library(igraph)
movement <- data.frame(from=c(data$start.station.id), to=c(data$end.station.id))
g <- graph.data.frame(movement, directed=TRUE)
print(g)
print("Printed a graph")
#print(g.degree())
plot(g,"bicycle_network.pdf")
save(g,'graph')
print("Closenss")
print(closeness(g))
print(closeness(g2, mode="in"))
print(closeness(g2, mode="out"))
print(closeness(g2, mode="all"))
print(betweenness(g))
print(edge_betweenness(g))
png("my_plot.png", 5000, 5000)
plot(g)
title("Bicycle Network",cex.main=1,col.main="blue")
dev.off()