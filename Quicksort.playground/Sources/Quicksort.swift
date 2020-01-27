import Foundation

public extension Array where Element: Comparable {
    
    /// Quicksort is a divide-and-conquer method for sorting. It works by partitioning an array into two sub-arrays, then sorting the sub-arrays independently.
    ///
    /// - Complexity: O(n log n)
    ///
    /// - Returns: A sorted array of the sequence's elements
    func quicksort() -> [Element] {
        return quicksort(self)
    }
    
    /// Quicksort is a divide-and-conquer method for sorting. It works by partitioning an array into two sub-arrays, then sorting the sub-arrays independently.
    ///
    /// - Complexity: O(n log n)
    ///
    /// - Parameter array: The array to be sorted.
    ///
    /// - Returns: A sorted array of the sequence's elements
    private func quicksort(_ array: [Element]) -> [Element] {
        guard array.count > 1 else { return array }
        
        let pivot = array[array.count / 2]
        let less = array.filter { $0 < pivot }
        let equal = array.filter { $0 == pivot }
        let greater = array.filter { $0 > pivot }
        
        return quicksort(less) + equal + quicksort(greater)
    }
}

public extension Array where Element: Comparable {
    
    /// Quicksort algorithm using Lomuto’s partitioning.
    ///
    /// - Complexity: O(n log n)
    mutating func quicksortLomuto() {
        quicksortLomuto(&self, low: 0, high: count - 1)
    }
    
    /// Quicksort algorithm using Lomuto’s partitioning.
    ///
    /// - Complexity: O(n log n)
    ///
    /// - Parameters:
    ///     - array: The array to partition.
    ///     - low: Low index for the partition,
    ///     - high: High index for the partition.
    ///
    /// - Returns: A sorted array of the sequence's elements
    private func quicksortLomuto(_ array: inout [Element], low: Int, high: Int) {
        if low < high {
            let partition = partitionLomuto(&array, low: low, high: high)
            quicksortLomuto(&array, low: low, high: partition - 1)
            quicksortLomuto(&array, low: partition + 1, high: high)
        }
    }
    
    /// Quick sort partitioning scheme that always chooses the last element as the pivot.
    ///
    /// - Complexity: O(n)
    ///
    /// - Parameters:
    ///     - array: The array to partition.
    ///     - low: Low index for the partition,
    ///     - high: High index for the partition.
    ///
    /// - Returns: The index of the pivot.
    private func partitionLomuto(_ array: inout [Element], low: Int, high: Int) -> Int {
        // Select the highest element as the pivot
        let pivot = array[high]
        var index = low
        for j in stride(from: low, to: high, by: 1) {
            // Swap all elements smaller than the pivot with the current index and increase it.
            if array[j] <= pivot {
                array.swapAt(index, j)
                index += 1
            }
        }
        // At last, all elements smaller than the pivot will be behind the index. All elements greater or equal will be in front of it. Swap the pivot and the index.
        array.swapAt(index, high)
        return index
    }
}

