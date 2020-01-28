import Foundation

public class AdjacencyList<T: Hashable>: Graph {
    
    fileprivate var adjacencyList: [EdgeList<T>] = []
    
    public init() {}
    
    public func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(index: adjacencyList.count, data: data)
        adjacencyList.append(EdgeList(vertex: vertex))
        return vertex
    }
    
    public func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        adjacencyList[source.index].add(Edge(source: source, destination: destination, weight: weight))
    }
    
    public func edges(from source: Vertex<T>) -> [Edge<T>] {
        adjacencyList[source.index].edges
    }
    
    public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        adjacencyList[source.index].edges.first(where: { $0.destination == destination })?.weight
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

private struct EdgeList<T> where T: Hashable {
    var vertex: Vertex<T>
    var edges: [Edge<T>] = []

    mutating func add(_ edge: Edge<T>) {
        edges.append(edge)
    }
}
