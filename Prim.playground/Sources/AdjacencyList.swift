import Foundation

/**
 An adjacency list implementation of a graph. Adjacency lists store a list of outgoing edges for every vertex in the graph.
*/
public class AdjacencyList<Element: Hashable>: Graph {
    
    /// The list of outgoing edges for every vertex in the graph.
    fileprivate var adjacencyList: [EdgeList<Element>] = []
    
    /// The list of vertices in the graph.
    public var vertices: [Vertex<Element>] {
        adjacencyList.map { $0.vertex }
    }
        
    public init() {}
    
    /// Creates a vertex and adds it to the graph.
    ///
    /// - Complexity: O(1)
    ///
    /// - Parameter data: The value to be assigned to the vertex.
    ///
    /// - Returns: The vertex that was added to the graph.
    public func createVertex(data: Element) -> Vertex<Element> {
        let vertex = Vertex(index: adjacencyList.count, data: data)
        adjacencyList.append(EdgeList(vertex: vertex))
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
    public func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double? = nil) {
        adjacencyList[source.index].add(Edge(source: source, destination: destination, weight: weight))
    }
    
    /// Returns a list of outgoing edges from a specific vertex.
    ///
    /// - Complexity: O(1)
    ///
    /// - Parameter source: The vertex from where to get the edges from.
    ///
    /// - Returns: A list of outgoing edges.
    public func edges(from source: Vertex<Element>) -> [Edge<Element>] {
        adjacencyList[source.index].edges
    }
    
    /// Returns the weight of the edge between two vertices.
    ///
    /// - Complexity: O(V)
    ///
    /// - Parameters:
    ///     - source: The source vertex of the edge.
    ///     - destination: The destination vertex of the edge.
    ///
    /// - Returns: The weight of the edge.
    public func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double? {
        adjacencyList[source.index].edges.first(where: { $0.destination == destination })?.weight
    }
}

extension AdjacencyList {
    public func copyEdgeLists<G: Graph>(from graph: G) where G.Element == Element {
        for vertex in graph.vertices {
            adjacencyList.append(EdgeList(vertex: vertex))
        }
    }
}

extension AdjacencyList: CustomStringConvertible {
    public var description: String {
        var result = ""
        for adjacency in adjacencyList {
            var edgeString = ""
            for (index, edge) in adjacency.edges.enumerated() {
                if index != adjacency.edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(adjacency.vertex) ---> [ \(edgeString) ]\n")
        }
        return result
    }
}

private struct EdgeList<Element> where Element: Hashable {
    var vertex: Vertex<Element>
    var edges: [Edge<Element>] = []

    mutating func add(_ edge: Edge<Element>) {
        edges.append(edge)
    }
}
