import Foundation

extension Graph where Element: Hashable {
    
    /// Traverses a graph by starting at a source vertex and explores as far as possible along each branch before backtracking.
    ///
    /// - Complexity: O(V + E)
    ///
    /// - Parameter source: The vertex where to start the traversal from.
    ///
    /// - Returns: A list of vertices in the order they were traversed.
    public func depthFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>] {
        var stack = Stack<Vertex<Element>>()
        var pushed: Set<Vertex<Element>> = []
        var visited: [Vertex<Element>] = []
        
        stack.push(source)
        pushed.insert(source)
        
        while let vertex = stack.pop() {
            visited.append(vertex)
            for edge in edges(from: vertex) {
                let destination = edge.destination
                if !pushed.contains(destination) {
                    stack.push(destination)
                    pushed.insert(destination)
                }
            }
        }
        return visited
    }
}
