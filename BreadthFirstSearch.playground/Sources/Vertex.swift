import Foundation

/// Represents a vertex in a graph.
public struct Vertex<T>: Hashable where T: Hashable {
    public let index: Int
    public let data: T
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(index): \(data)"
    }
}
