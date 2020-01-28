import Foundation

public struct Edge<T>: Equatable where T: Hashable {
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
