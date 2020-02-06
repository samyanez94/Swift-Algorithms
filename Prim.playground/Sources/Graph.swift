import Foundation

/**
 A graph is a data structure that captures relationships between objects. Graphs are made up of vertices connected by edges.
 */
public protocol Graph {
    associatedtype Element: Hashable
    
    var vertices: [Vertex<Element>] { get }
    
    func createVertex(data: Element) -> Vertex<Element>
    func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?)
    func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
}

extension Graph {
    /// Adds an undirected edge between two vertices.
    ///
    /// - Parameters:
    ///     - source: The source vertex of the edge.
    ///     - destination: The destination vertex of the edge.
    ///     - weight: The weight of the edge.
    public func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double? = nil) {
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
    
    /// Adds an edge (directed or undirected) between two vertices.
    ///
    /// - Parameters:
    ///     - edgeType: The type of the edge.
    ///     - source: The source vertex of the edge.
    ///     - destination: The destination vertex of the edge.
    ///     - weight: The weight of the edge.
    public func add(_ edgeType: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double? = nil) {
        switch edgeType {
        case .directed: addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected: addUndirectedEdge(between: source, and: destination, weight: weight)
        }
    }
}

/// Describes the different types of edges.
public enum EdgeType {
    case directed
    case undirected
}
