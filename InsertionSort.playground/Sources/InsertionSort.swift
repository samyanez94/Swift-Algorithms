import Foundation

public extension Array where Element: Comparable {
    
    /// Insertion sort works similarly to the algorithm that people often use to sort bridge hands. This is to consider the cards one at a time, inserting each into its proper place among those already considered.
    ///
    /// - Complexity: O(n^2)
    mutating func insertionSort() {
        insertionSort(orderCriteria: <)
    }
    
    /// Insertion sort works similarly to the algorithm that people often use to sort bridge hands. This is to consider the cards one at a time, inserting each into its proper place among those already considered.
    ///
    /// - Complexity: O(n^2)
    ///
    /// - Parameter orderCriteria: Closure used to sort the array.
    mutating func insertionSort(orderCriteria: (Element, Element) -> Bool) {
        for i in stride(from: 1, to: count, by: 1) {
            for j in stride(from: i, to: 0, by: -1) {
                if orderCriteria(self[j], self[j - 1]) {
                    swapAt(j, j - 1)
                }
            }
        }
    }
}
