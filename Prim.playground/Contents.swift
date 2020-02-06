// Define graph
let graph = AdjacencyList<String>()

// Add vertices
let sanFrancisco = graph.createVertex(data: "San Francisco")
let oakland = graph.createVertex(data: "Oakland")
let eureka = graph.createVertex(data: "Eureka")
let sacramento = graph.createVertex(data: "Sacramento")
let yosemite = graph.createVertex(data: "Yosemite")
let sanJose = graph.createVertex(data: "San Jose")
let bakersfield = graph.createVertex(data: "Bakersfield")
let losAngeles = graph.createVertex(data: "Los Angeles")
let sanDiego = graph.createVertex(data: "San Diego")

// Add egdes
graph.add(.undirected, from: sanFrancisco, to: eureka, weight: 8)
graph.add(.undirected, from: sanFrancisco, to: oakland, weight: 1)
graph.add(.undirected, from: sanFrancisco, to: sanJose, weight: 3)
graph.add(.undirected, from: sanFrancisco, to: yosemite, weight: 7)
graph.add(.undirected, from: eureka, to: sacramento, weight: 6)
graph.add(.undirected, from: oakland, to: sacramento, weight: 2)
graph.add(.undirected, from: oakland, to: yosemite, weight: 5)
graph.add(.undirected, from: sacramento, to: yosemite, weight: 4)
graph.add(.undirected, from: sanJose, to: yosemite, weight: 7)
graph.add(.undirected, from: sanJose, to: losAngeles, weight: 10)
graph.add(.undirected, from: losAngeles, to: sanDiego, weight: 1)
graph.add(.undirected, from: losAngeles, to: bakersfield, weight: 7)
graph.add(.undirected, from: bakersfield, to: yosemite, weight: 7)

// Print graph
print(graph)

// Find the minimum spanning tree
let minimumSpanningTree = graph.minimumSpanningTree()

// Print cost
print("Total cost: \(minimumSpanningTree.cost)")

// Print graph
print(minimumSpanningTree.graph)
