import Foundation

public extension Array where Element == Int {
    
    /// Counting sort is an algorithm for sorting a collection of objects according to keys that are small integers. It operates by counting the number of objects that have each distinct key value, and using arithmetic on those counts to determine the positions of each key value in the output sequence.
    ///
    /// - Complexity:
    ///     O(n + k) where k is the range of the non-negative key values.
    func countingSort() -> [Element] {
        return countingSort(self)
    }
    
    /// Counting sort is an algorithm for sorting a collection of objects according to keys that are small integers. It operates by counting the number of objects that have each distinct key value, and using arithmetic on those counts to determine the positions of each key value in the output sequence.
    ///
    /// - Complexity:
    ///     O(n + k) where k is the range of the non-negative key values.
    ///
    /// - Parameter array: The array to be sorted.
    ///
    /// - Returns: A sorted array of the sequence's elements.
    private func countingSort(_ array: [Element]) -> [Element] {
        let highestNumber = array.max() ?? 0
        
        var counts = [Int](repeating: 0, count: Int(highestNumber + 1))
        
        for number in array {
          counts[number] += 1
        }
        
        var sorted = [Int]()
        
        for (index, count) in counts.enumerated() {
            for _ in stride(from: 0, to: count, by: 1) {
                sorted.append(index)
            }
        }
        return sorted
    }
}
