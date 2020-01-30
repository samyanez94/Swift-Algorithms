import Foundation

/**
 A stack is a linear collection whose elements are added and removed from the same end (LIFO). Said in another way, the elements of a stack are removed in the reverse order of their placement on it.
 */
public struct Stack<T> {
    
    /// Serves as a storage for the stack.
    private var array: [T] = []
    
    /// Computed property that returns true is the stack is empty.
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    /// Computed propery that returns the number of elements in the stack.
    public var count: Int {
        array.count
    }
    
    /// Computer property that returns the elements on the top of the stack.
    public var top: T? {
        array.last
    }
    
    /// Default public initializer.
    public init() {}
    
    /// Adds an element to the top of the stack.
    ///
    /// - Complexity: O(1)
    ///
    /// - Parameter element: The element to be added to the stack.
    public mutating func push(_ element: T) {
      array.append(element)
    }
    
    /// Removes the element on the top of the stack.
    ///
    /// - Complexity: O(1)
    ///
    /// - Returns: The removed element.
    @discardableResult public mutating func pop() -> T? {
       array.popLast()
    }
}
