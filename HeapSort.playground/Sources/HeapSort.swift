import Foundation

extension Heap {
    
    /// Returns a sorted array from the element in the heap.
    ///
    /// - Complexity: O(n log n)
    ///
    /// - Returns: A sorted array containing the elements in the heap.
    public mutating func sort() -> [Element] {
        for index in stride(from: nodes.count - 1, through: 1, by: -1) {
            nodes.swapAt(0, index)
            shiftDown(from: 0, until: index)
        }
        return nodes
    }
}

extension Array where Element: Comparable {
    
    /// Heap sort is a comparison-based algorithm that sorts an array using a heap.
    ///
    /// - Complexity: O(n log n)
    ///
    /// - Returns: A sorted array of the sequence's elements.
    public func heapSort() -> [Element] {
        return heapSort(orderCriteria: <)
    }
    
    /// Heap sort is a comparison-based algorithm that sorts an array using a heap.
    ///
    /// - Complexity: O(n log n)
    ///
    /// - Parameter orderCriteria: Closure used to sort the array.
    ///
    /// - Returns: A sorted array of the sequence's elements.
    public func heapSort(orderCriteria: @escaping (Element, Element) -> Bool) -> [Element] {
        let reverseCriteria = { first, second in orderCriteria(second, first) }
        var heap = Heap(from: self, orderCriteria: reverseCriteria)
        return heap.sort()
    }
}
