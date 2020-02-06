import Foundation

/// Represents the direction back to the root vertex.
public enum Visit<Element: Hashable> {
  case source
  case edge(Edge<Element>)
}

/// Uses the Dijkstra shortest path algorithm to find the shortest path between a source and a destination vertices.
///
/// - Complexity: O(log V)
///
/// - Parameters
///     - source: The source vertex.
///     - destination: The destination vertex.
///
/// - Returns: An array of edges representing the shortest path between the two vertices.
extension Graph {
    public func shortestPath(from source: Vertex<Element>, to destination: Vertex<Element>) -> [Edge<Element>]? {
        var paths : [Vertex<Element> : Visit<Element>] = [source: .source]
        var priorityQueue = PriorityQueue<Vertex<Element>>(orderCriteria: { self.distance(to: $0, with: paths) < self.distance(to: $1, with: paths) })
        priorityQueue.enqueue(source)
        
        while let visitedVertex = priorityQueue.dequeue() {
            if visitedVertex == destination {
                return route(to: destination, with: paths)
            }
            let neighbourEdges = edges(from: visitedVertex)
            for edge in neighbourEdges {
                if let weight = edge.weight {
                    if paths[edge.destination] != nil {
                        if distance(to: visitedVertex, with: paths) + weight < distance(to: edge.destination, with: paths) {
                            paths[edge.destination] = .edge(edge)
                            priorityQueue.enqueue(edge.destination)
                        }
                    }
                    else {
                        paths[edge.destination] = .edge(edge)
                        priorityQueue.enqueue(edge.destination)
                    }
                }
            }
        }
        return nil
    }
    
    /// Returns the path from the source vertex to the destination.
    ///
    /// - Parameters
    ///     - destination: The destination vertex.
    ///     - paths: A dictionary of existing paths.
    ///
    /// - Returns: The path from the source vertex to the destination.
    public func route(to destination: Vertex<Element>, with paths: [Vertex<Element>: Visit<Element>]) -> [Edge<Element>] {
        var vertex = destination
        var path: [Edge<Element>] = []
        
        while let visit = paths[vertex], case .edge(let edge) = visit {
            path = [edge] + path
            vertex = edge.source
        }
        return path
    }
    
    /// Returns the total weight of a path from the source vertex to the destination.
    ///
    /// - Parameters
    ///     - destination: The destination vertex.
    ///     - paths: A dictionary of existing paths.
    ///
    /// - Returns: The total weight of a path from the source vertex to the destination.
    private func distance(to destination: Vertex<Element>, with paths: [Vertex<Element>: Visit<Element>]) -> Double {
        let path = route(to: destination, with: paths)
        let distances = path.compactMap { $0.weight }
        return distances.reduce(0.0, +)
    }
}
