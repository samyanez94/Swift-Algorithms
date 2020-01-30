import Foundation

/**
 A queue is a linear collection whose elements are added on one end and removed from the other. Therefore, we say that queue elements are processed in a first in, first out (FIFO) manner. Elements are removed from a queue in the same order in which they are placed on the queue.
 */
public struct Queue<T> {
    
    /// Serves as a storage for the queue.
    private var array: [T] = []
    
    /// Computed property that returns true is the queue is empty.
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    /// Computed propery that returns the number of elements in the queue.
    public var count: Int {
       array.count
    }
    
    /// Computer property that returns the first element on the queue.
    public var peek: T? {
        array.first
    }
    
    /// Default public initializer.
    public init() {}
    
    /// Inserts an element to the back of the queue.
    ///
    /// - Complexity: O(1)
    ///
    /// - Parameter element: The element to be inserted.
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    /// Removes the element in the front of the queue if any.
    ///
    /// - Complexity: O(n)
    ///
    /// - Returns: The removed element.
    @discardableResult public mutating func dequeue() -> T? {
        isEmpty ? nil : array.removeFirst()
    }
}
