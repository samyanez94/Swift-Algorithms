// Graph from adjacency list

// Define graph
let graph = AdjacencyList<String>()

// Add vertices
let singapore = graph.createVertex(data: "Singapore")
let tokyo = graph.createVertex(data: "Tokyo")
let hongKong = graph.createVertex(data: "Hong Kong")
let detroit = graph.createVertex(data: "Detroit")
let sanFrancisco = graph.createVertex(data: "San Francisco")
let washington = graph.createVertex(data: "Washington DC")
let austin = graph.createVertex(data: "Austin")
let seattle = graph.createVertex(data: "Seattle")

// Add edges
graph.add(.undirected, from: singapore, to: hongKong, weight: 300)
graph.add(.undirected, from: singapore, to: tokyo, weight: 500)
graph.add(.undirected, from: hongKong, to: tokyo, weight: 250)
graph.add(.undirected, from: tokyo, to: detroit, weight: 450)
graph.add(.undirected, from: tokyo, to: washington, weight: 300)
graph.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
graph.add(.undirected, from: detroit, to: austin, weight: 50)
graph.add(.undirected, from: austin, to: washington, weight: 292)
graph.add(.undirected, from: sanFrancisco, to: washington, weight: 337)
graph.add(.undirected, from: washington, to: seattle, weight: 277)
graph.add(.undirected, from: sanFrancisco, to: seattle, weight: 218)
graph.add(.undirected, from: austin, to: sanFrancisco, weight: 297)

// Print graph
print(graph)

// How much is a flight from SFO to HKG?
graph.weight(from: sanFrancisco, to: hongKong)
