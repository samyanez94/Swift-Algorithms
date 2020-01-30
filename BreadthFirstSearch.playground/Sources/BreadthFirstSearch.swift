import Foundation

extension Graph where Element: Hashable {
    
    /// Traverses a graph by starting at a source vertex and exploring the immediate neighbor vertices first, before moving to the next level neighbors.
    ///
    /// - Complexity: O(V + E)
    ///
    /// - Parameter source: The vertex where to start the traversal from.
    ///
    /// - Returns: A list of vertices in the order they were traversed.
    public func breadthFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>] {
        var queue = Queue<Vertex<Element>>()
        var enqueued: Set<Vertex<Element>> = []
        var visited: [Vertex<Element>] = []
        
        queue.enqueue(source)
        enqueued.insert(source)
        
        while let vertex = queue.dequeue() {
            visited.append(vertex)
            for edge in edges(from: vertex) {
                let destination = edge.destination
                if !enqueued.contains(destination) {
                    queue.enqueue(destination)
                    enqueued.insert(destination)
                }
            }
        }
        return visited
    }
}
