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
        for i in 0..<self.count {
            var min = i
            for j in (i + 1)..<self.count {
                if orderCriteria(self[j], self[min]) {
                    min = j
                }
            }
            self.swapAt(i, min)
        }
    }
}
