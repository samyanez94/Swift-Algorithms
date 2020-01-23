import Foundation

/**
 A queue is a linear collection whose elements are added on one end and removed from the other. Therefore, we say that queue elements are processed in a first in, first out (FIFO) manner. Elements are removed from a queue in the same order in which they are placed on the queue.
 */
public struct Queue<T> {
    
    /// Serves as a storage for the stack.
    private var array: [T] = []
    
    /// Computed property that returns true is the collection is empty.
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    /// Computed propery that returns the number of elements in the collection.
    public var count: Int {
       array.count
    }
    
    /// Computer property that returns the elements on the top of the collection.
    public var top: T? {
      return array.last
    }
    
    /// Default public initializer.
    public init() {}
    
    /// Inserts an element to the back of the collection.
    ///
    /// - Parameter element: The element to be inserted.
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    /// Removes the element in the front of the queue if any.
    ///
    /// - Returns: The removed element.
    @discardableResult
    public mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        
        return array.removeFirst()
    }
}
