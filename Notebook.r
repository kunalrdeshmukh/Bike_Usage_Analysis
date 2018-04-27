
data1307 <- read.csv(file="Data/2013-07 - Citi Bike trip data.csv", header=TRUE, sep=",")

data  = data1307 

head(data,2)

summary(data)


counts <- table(data$gender)
barplot(counts, main="Gender Distribution", 
  	xlab="Gender")

counts <- table(data$birth.year)
barplot(counts, main="Birth Year Distribution", 
  	xlab="Birth Year")

counts <- table(data$tripduration)
barplot(counts, main="distribution of trip duration", 
  	xlab="Trip duration")

apply(data, 2, function(x) any(is.na(x)))

max(unique(c(data$start.station.id , data$end.station.name )))

library(igraph)
movement <- data.frame(from=c(data$start.station.id), to=c(data$end.station.id))
g <- graph.data.frame(movement, directed=TRUE)
print g

print(g.degree())

save(g)

print(closeness(g))
print(closeness(g2, mode="in"))
print(closeness(g2, mode="out"))
print(closeness(g2, mode="all"))
print(betweenness(g))
print(edge_betweenness(g))
