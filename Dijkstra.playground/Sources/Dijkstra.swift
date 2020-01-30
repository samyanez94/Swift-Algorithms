import Foundation

public enum Visit<Element: Hashable> {
  case source
  case edge(Edge<Element>)
}

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
    
    public func route(to destination: Vertex<Element>, with paths: [Vertex<Element>: Visit<Element>]) -> [Edge<Element>] {
        var vertex = destination
        var path: [Edge<Element>] = []
        
        while let visit = paths[vertex], case .edge(let edge) = visit {
            path = [edge] + path
            vertex = edge.source
        }
        return path
    }
    
    private func distance(to destination: Vertex<Element>, with paths: [Vertex<Element> : Visit<Element>]) -> Double {
        let path = route(to: destination, with: paths)
        let distances = path.compactMap { $0.weight }
        return distances.reduce(0.0, +)
    }
}
