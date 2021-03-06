import Foundation

/// Represents an edge in a graph.
public struct Edge<Element>: Hashable where Element: Hashable {
    public let source: Vertex<Element>
    public let destination: Vertex<Element>
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
