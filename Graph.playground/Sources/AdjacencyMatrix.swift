import Foundation

/**
 An adjacency matrix implementation of a graph. Adjacency matrixes use a square matrix to represent a graph.
*/
public class AdjacencyMatrix<T: Hashable>: Graph {
    
    /// List of vertices
    private var vertices: [Vertex<T>] = []
    
    /// Square matrix to represent a graph
    private var adjacencyMatrix: [[Double?]] = []
    
    public init() {}
    
    /// Creates a vertex and adds it to the graph.
    ///
    /// - Complexity: O(V^2)
    ///
    /// - Parameter data: The value to be assigned to the vertex.
    ///
    /// - Returns: The vertex that was added to the graph.
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
    
    /// Adds a directed edge between two vertices.
    ///
    /// - Complexity: O(1)
    ///
    /// - Parameters:
    ///     - source: The source vertex of the edge.
    ///     - destination: The destination vertex of the edge.
    ///     - weight: The weight of the edge.
    public func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double? = nil) {
        adjacencyMatrix[source.index][destination.index] = weight
    }
    
    /// Returns a list of outgoing edges from a specific vertex.
    ///
    /// - Complexity: O(V^2)
    ///
    /// - Parameter source: The vertex from where to get the edges from.
    ///
    /// - Returns: A list of outgoing edges.
    public func edges(from source: Vertex<T>) -> [Edge<T>] {
        var edges: [Edge<T>] = []
        for index in stride(from: 0, to: adjacencyMatrix.count, by: 1) {
            if let weight = adjacencyMatrix[source.index][index] {
                edges.append(Edge(source: source, destination: vertices[index], weight: weight))
            }
        }
        return edges
    }
    
    /// Returns the weight of the edge between two vertices.
    ///
    /// - Complexity: O(1)
    ///
    /// - Parameters:
    ///     - source: The source vertex of the edge.
    ///     - destination: The destination vertex of the edge.
    ///
    /// - Returns: The weight of the edge.
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
