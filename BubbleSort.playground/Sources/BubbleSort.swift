import Foundation

public extension Array where Element: Comparable {
    
    /// Bubble sort compares adjacent values and swaps them, if needed, to perform the sort. The larger values in the set will therefore "bubble up" to the end of the collection.
    ///
    /// - Complexity: O(n^2)
    mutating func bubbleSort() {
        bubbleSort(orderCriteria: <)
    }
    
    /// Bubble sort compares adjacent values and swaps them, if needed, to perform the sort. The larger values in the set will therefore "bubble up" to the end of the collection.
    ///
    /// - Complexity: O(n^2)
    ///
    /// - Parameter orderCriteria: Closure used to sort the array.
    mutating func bubbleSort(orderCriteria: (Element, Element) -> Bool) {
        for i in stride(from: 0, to: count, by: 1) {
            for j in stride(from: 1, to: count - i, by: 1) {
               if orderCriteria(self[j], self[j - 1]) {
                    swapAt(j, j - 1)
                }
            }
        }
    }
}
