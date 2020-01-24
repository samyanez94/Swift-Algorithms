import Foundation

public extension Array where Element: Comparable {
    
    /// Selection sort repeadely finds the smallest item in an array and places it into its sorted place until the entire array is sorted.
    ///
    /// - Complexity: O(n^2)
    mutating func selectionSort() {
        selectionSort(orderCriteria: <)
    }
    
    /// Selection sort repeadely finds the smallest item in an array and places it into its sorted place until the entire array is sorted.
    ///
    /// - Complexity: O(n^2)
    ///
    /// - Parameter orderCriteria: Closure used to sort the array.
    mutating func selectionSort(orderCriteria: (Element, Element) -> Bool) {
        for i in stride(from: 0, to: count, by: 1) {
            var min = i
            for j in stride(from: i + 1, to: count, by: 1) {
                if orderCriteria(self[j], self[min]) {
                    min = j
                }
            }
            swapAt(i, min)
        }
    }
}
