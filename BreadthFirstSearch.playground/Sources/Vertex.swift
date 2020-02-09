import Foundation

/// Represents a vertex in a graph.
public struct Vertex<Element>: Hashable where Element: Hashable {
    public let index: Int
    public let data: Element
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(index): \(data)"
    }
}
