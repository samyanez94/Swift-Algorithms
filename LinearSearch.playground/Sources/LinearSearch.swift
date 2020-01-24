import Foundation

public extension RandomAccessCollection where Element: Comparable {

    /// Linear search iterates over all the objects in a collection and returns the index of the object to be searched if it is found.
    ///
    /// - Complexity: O(n)
    ///
    /// -   Parameter value: The value to be search for in the collection.
    ///
    /// - Returns: The index of the value in the collection if found.
    func linearSearch(_ value: Element) -> Int? {
        for (index, object) in self.enumerated() where object == value {
          return index
        }
        return nil
    }
}
