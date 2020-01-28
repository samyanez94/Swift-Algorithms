import Foundation

public class AdjacencyMatrix<T: Hashable>: Graph {
    
    private var vertices: [Vertex<T>] = []
    
    private var adjacencyMatrix: [[Double?]] = []
    
    public init() {}
    
    public func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(index: adjacencyMatrix.count, data: data)
        for i in stride(from: 0, to: adjacencyMatrix.count, by: 1) {
          adjacencyMatrix[i].append(nil)
        }
        let row = [Double?](repeating: nil, count: adjacencyMatrix.count + 1)
        adjacencyMatrix.append(row)
        vertices.append(vertex)
        return vertex
    }
    
    public func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        adjacencyMatrix[source.index][destination.index] = weight
    }
    
    public func edges(from source: Vertex<T>) -> [Edge<T>] {
        var edges: [Edge<T>] = []
        for index in stride(from: 0, to: adjacencyMatrix.count, by: 1) {
            if let weight = adjacencyMatrix[source.index][index] {
                edges.append(Edge(source: source, destination: vertices[index], weight: weight))
            }
        }
        return edges
    }
    
    public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        adjacencyMatrix[source.index][destination.index]
    }
}

extension AdjacencyMatrix: CustomStringConvertible {
    public var description: String {
        let verticesDescription = vertices.map { "\($0)" }
        var grid: [String] = []
        for i in stride(from: 0, to: adjacencyMatrix.count, by: 1) {
            var row = ""
            for j in stride(from: 0, to: adjacencyMatrix.count, by: 1) {
                if let value = adjacencyMatrix[i][j] {
                    row += "\(value)\t"
                } else {
                    row += "nil\t\t"
                }
            }
            grid.append(row)
        }
        let edgesDescription = grid.joined(separator: "\n")
        return "\(verticesDescription)\n\n\(edgesDescription)"
    }
}
