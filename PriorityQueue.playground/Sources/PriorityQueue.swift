import Foundation

/**
 A priority queue is a queue where the most important element is always at the front. Priority queues are useful for algorithms that need to process a large number of items and where you repeatedly need to identify which one is now the biggest or smallest.
*/
public struct PriorityQueue<Element: Equatable> {
    
    /// Heap data structure to serve as a container for the queue. A heap ensures priority is maintained.
    private var heap: Heap<Element>
    
    /// Computed property that returns true is the queue is empty.
    public var isEmpty: Bool {
        heap.isEmpty
    }
    
    /// Computed propery that returns the number of elements in the queue.
    public var count: Int {
        heap.count
     }
    
    /// Public initializer
    public init(elements: [Element] = [], orderCriteria: @escaping (Element, Element) -> Bool) {
        heap = Heap(from: elements, orderCriteria: orderCriteria)
    }
    
    /// Returns the first element in queue.
    ///
    /// - Complexity: O(1)
    ///
    /// - Returns: The first element in the queue.
    public func peek() -> Element? {
        heap.peek()
    }
    
    /// Inserts an element to the queue.
    ///
    /// - Complexity: O(log n)
    ///
    /// - Parameter element: The element to be inserted.
    public mutating func enqueue(_ element: Element) {
        heap.insert(element)
    }
    
    /// Removes the element from the queue.
    ///
    /// - Complexity: O(log n)
    ///
    /// - Returns: The removed element.
    public mutating func dequeue() -> Element? {
        heap.remove()
    }
}
