import Foundation

/**
 A heap is a binary tree data structure that is sorted based on the "heap property" that determines the order of the nodes in the tree.
*/
public struct Heap<Element: Equatable> {
    /// Serves as a storage for the heap.
    var nodes = [Element]()
    
    /// Determines how to compare two nodes in the heap.
    private let orderCriteria: (Element, Element) -> Bool
    
    /// Computed property that returns true is the heap is empty.
    public var isEmpty: Bool {
        nodes.isEmpty
    }
    
    /// Computed propery that returns the number of elements in the heap.
    public var count: Int {
        nodes.count
    }
    
    /// Public initializer.
    public init(orderCriteria: @escaping (Element, Element) -> Bool) {
        self.orderCriteria = orderCriteria
    }
    
    /// Public initializer from array.
    public init(from elements: [Element], orderCriteria: @escaping (Element, Element) -> Bool) {
        self.nodes = elements
        self.orderCriteria = orderCriteria
        for index in stride(from: nodes.count / 2 - 1, through: 0, by: -1) {
            shiftDown(from: index)
        }
    }
    
    /// Returns the maximum value in the heap (for a max-heap) or the minimum value (for a min-heap).
    ///
    /// - Complexity: O(1)
    ///
    /// - Returns: The  maximum or minimum value in the heap.
    public func peek() -> Element? {
        nodes.first
    }
    
    /// Returns the index of the parent of the element at index i.
    ///
    /// - Complexity: O(1)
    ///
    /// - Parameter i: The index of the element.
    ///
    /// - Returns: The index of the parent of the element.
    func parentIndex(ofIndex i: Int) -> Int {
        (i - 1) / 2
    }
    
    /// Returns the index of the left child of the element at index i.
    ///
    /// - Complexity: O(1)
    ///
    /// - Parameter i: The index of the element.
    ///
    /// - Returns: The index of the left child of the element.
    private func leftChildIndex(ofIndex i: Int) -> Int {
        (2 * i) + 1
    }
    
    /// Returns the index of the right child of the element at index i.
    ///
    /// - Complexity: O(1)
    ///
    /// - Parameter i: The index of the element.
    ///
    /// - Returns: The index of the right child of the element.
    private func rightChildIndex(ofIndex i: Int) -> Int {
        (2 * i) + 2
    }
    
    /// Finds the index of the node in the heap if found.
    ///
    /// - Complexity: O(n)
    ///
    /// - Parameter node: The node to search for.
    ///
    /// - Returns: The index of the node if found
    public func index(of node: Element) -> Int? {
        nodes.firstIndex(where: { $0 == node })
    }
    
    /// Adds a new value to the heap. This reorders the heap so that the max-heap or min-heap property still holds.
    ///
    /// - Complexity: O(log n)
    ///
    public mutating func insert(_ value: Element) {
        nodes.append(value)
        shiftUp(from: nodes.count - 1)
    }
    
    /// Returns the root node from the heap. In the case of a max-heap, this is the maximum value; for a min-heap it is the minimum value.
    ///
    /// - Complexity: O(log n)
    ///
    /// - Returns: The root node from the heap.
    @discardableResult public mutating func remove() -> Element? {
        guard !nodes.isEmpty else { return nil }
        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            // Swap root and last values.
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            
            // Restore the "heap property".
            shiftDown(from: 0)
            
            // Return root node.
            return value
        }
    }
    
    /// Returns the root node from the heap. In the case of a max-heap, this is the maximum value; for a min-heap it is the minimum value.
    ///
    /// - Complexity: O(log n)
    ///
    /// - Parameter index: The index of the element to remove.
    ///
    /// - Returns: The removed element.
    @discardableResult public mutating func remove(at index: Int) -> Element? {
        guard index < nodes.count else { return nil }
        let size = nodes.count - 1
        if index != size {
          nodes.swapAt(index, size)
          shiftDown(from: index, until: size)
            shiftUp(from: index)
        }
        return nodes.removeLast()
    }
    
    /// Restores the "heap property" by swapping up values.
    ///
    /// - Complexity: O(log n)
    ///
    /// - Parameter index: The index of the element where the shift should start.
    mutating func shiftUp(from index: Int) {
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = self.parentIndex(ofIndex: childIndex)
        
        while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
        nodes[childIndex] = child
    }
    
    /// Restores the "heap property" by recursively swapping down values.
    ///
    /// - Parameter index: The index of the element where the shift should start.
    mutating func shiftDown(from index: Int) {
        shiftDown(from: index, until: nodes.count)
    }
    
    /// Restores the "heap property" by recursively swapping down values.
    ///
    /// - Complexity: O(log n)
    ///
    /// - Parameters:
    ///     - index: The index of the element where the shift should start.
    ///     - endIndex: The index of the element where the shift should end.
    mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = self.rightChildIndex(ofIndex: index)
      
        var first = index
        
        // Figure out which node has higher precedence.
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        // Return if the node with higher precedence is the current one.
        if first == index { return }
        
        // Swap current and node with the highest precendence.
        nodes.swapAt(index, first)
        
        // Continue recursively until the break case.
        shiftDown(from: first, until: endIndex)
    }
}
