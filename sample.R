nodes <-  read.csv("0.feat.csv", header=T, as.is=T)
links <-  read.csv("0.edges.csv", header=T, as.is=T)
head(nodes)
head(links)
nrow(nodes); length(unique(nodes$ID))
nrow(links); nrow(unique(links[,c("from", "to")]))
links <- aggregate(links[,3], links[,-3], sum)
links <- links[order(links$from, links$to),]
colnames(links)[2] <- "weight"
rownames(links) <- NULL
nodes2 <-  read.csv("Dataset2-Media-User-Example-NODES.csv", header=T, as.is=T)
links2 <-  read.csv("Dataset2-Media-User-Example-EDGES.csv", header=T, as.is=T)
head(nodes2)
head(links2)
links2 <-  as.matrix(links2)
dim(links)
dim(nodes)
library(igraph)
net <-  graph.data.frame(links, nodes, directed=T)
net
E(net) # The edges of the "net" object
V(net) # The vertices of the "net" object
E(net)$type  # Edge attribute "type"
V(net)$media # Vertex attribute "media"
plot(net)
net <-  simplify(net,  remove.multiple =  F, remove.loops =  T)
plot(net,  edge.arrow.size=.4,vertex.label=NA)
head(nodes)