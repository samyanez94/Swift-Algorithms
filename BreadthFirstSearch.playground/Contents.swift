// Define graph
let graph = AdjacencyList<String>()

// Add vertices
let samuel = graph.createVertex(data: "Samuel")
let nicolas = graph.createVertex(data: "Nicolas")
let luis = graph.createVertex(data: "Luis")
let valeria = graph.createVertex(data: "Valeria")
let miguel = graph.createVertex(data: "Miguel")
let omar = graph.createVertex(data: "Omar")
let rebecca = graph.createVertex(data: "Rebecca")
let marcel = graph.createVertex(data: "Marcel")
let amaya = graph.createVertex(data: "Amaya")
let vittoria = graph.createVertex(data: "Vittoria")

// Add edges
graph.add(.undirected, from: samuel, to: nicolas)
graph.add(.undirected, from: samuel, to: luis)
graph.add(.undirected, from: samuel, to: valeria)
graph.add(.undirected, from: samuel, to: miguel)
graph.add(.undirected, from: samuel, to: omar)
graph.add(.undirected, from: luis, to: nicolas)
graph.add(.undirected, from: luis, to: valeria)
graph.add(.undirected, from: luis, to: marcel)
graph.add(.undirected, from: nicolas, to: rebecca)
graph.add(.undirected, from: valeria, to: amaya)
graph.add(.undirected, from: amaya, to: vittoria)

// Print graph
print(graph)

// Print breadth-first search
print(graph.breadthFirstSearch(from: samuel))
