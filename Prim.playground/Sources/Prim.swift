import Foundation

extension Graph {
    
    /// Uses Prim's algorithm to calculate a minimum spanning tree.
    /// 
    /// - Complexity: O(E log E)
    ///
    /// - Returns: A tuple contianing the cost of the minimum spanning tree and the tree itself as an adjancecy list.
    public func minimumSpanningTree() -> (cost: Double, graph: AdjacencyList<Element>) {
        var cost = 0.0
        let minimumSpanningTree = AdjacencyList<Element>()
        var visited: Set<Vertex<Element>> = []
        var priorityQueue = PriorityQueue<Edge<Element>>(orderCriteria: <)
        
        minimumSpanningTree.copyEdgeLists(from: self)
        
        guard let start = self.vertices.first else {
            return (cost: cost, graph: minimumSpanningTree)
        }
        
        visited.insert(start)
        addAvailableEdges(for: start, check: visited, to: &priorityQueue)
        
        while let smallestEdge = priorityQueue.dequeue() {
            let vertex = smallestEdge.destination
            
            guard !visited.contains(vertex) else { continue }
            
            visited.insert(vertex)
            cost += smallestEdge.weight ?? 0.0
            minimumSpanningTree.add(.undirected, from: smallestEdge.source, to: smallestEdge.destination, weight: smallestEdge.weight)
            addAvailableEdges(for: vertex, check: visited, to: &priorityQueue)
        }
        return (cost: cost, graph: minimumSpanningTree)
    }
    
    /// Helper function that adds all the edges from a vertex to a priority queue as long as the vertex is not in the visited set.
    ///
    /// - Complexity: O(E)
    ///
    private func addAvailableEdges(for vertex: Vertex<Element>, check visited: Set<Vertex<Element>>, to priorityQueue: inout PriorityQueue<Edge<Element>>) {
        for edge in edges(from: vertex) {
            if !visited.contains(edge.destination) {
                priorityQueue.enqueue(edge)
            }
        }
    }
}
