import Foundation

public extension Array where Element: Comparable {
    
    /// Merge sort is a divide and conquer algorithm that was invented by John Von Neumann in 1945. Merge sort works by sorting an array, dividing it into two halves, sorting the two halves recursively, and then merging the results.
    ///
    /// - Complexity: O(n log n)
    ///
    /// - Returns: A sorted array of the sequence's elements.
    mutating func mergeSort() -> [Element] {
        return mergeSort(self)
    }
    
    private func mergeSort(_ array: [Element]) -> [Element] {
        // Break case for the recursive algorithm.
        guard array.count > 1 else { return array }
        
        // Recursively split the array into halves.
        let middle = array.count / 2
        let left = mergeSort(Array(array[0..<middle]))
        let right = mergeSort(Array(array[middle..<array.count]))
        
        // Merge the halves together and sort them.
        return merge(left: left, right: right)
    }
    
    private func merge(left: [Element], right: [Element]) -> [Element] {
        var leftIndex = 0
        var rightIndex = 0
        var result: [Element] = []

        while true {
            guard leftIndex < left.endIndex else {
                result.append(contentsOf: right[rightIndex..<right.endIndex])
                break
            }
            guard rightIndex < right.endIndex else {
                result.append(contentsOf: left[leftIndex..<left.endIndex])
                break
            }
            if left[leftIndex] < right[rightIndex] {
                result.append(left[leftIndex])
                leftIndex += 1
            } else {
                result.append(right[rightIndex])
                rightIndex += 1
            }
        }
        return result
    }
}
