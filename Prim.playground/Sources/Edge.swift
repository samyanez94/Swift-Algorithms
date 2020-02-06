import Foundation

/// Represents an edge in a graph.
public struct Edge<T>: Hashable where T: Hashable {
    public let source: Vertex<T>
    public let destination: Vertex<T>
    public let weight: Double?
}

extension Edge: CustomStringConvertible {
    public var description: String {
        guard let weight = weight else {
            return "\(source.description) -> \(destination.description)"
        }
        return "\(source.description) -(\(weight))-> \(destination.description)"
    }
}

extension Edge: Comparable {
    public static func < (lhs: Edge<T>, rhs: Edge<T>) -> Bool {
        lhs.weight ?? 0.0 < rhs.weight ?? 0.0
    }
}
