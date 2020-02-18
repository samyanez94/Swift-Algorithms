import Foundation

public extension RandomAccessCollection where Element: Comparable {

    /// Binary search is a search algorithm that recursively splits the array in half until the value is found.
    ///
    /// - Complexity: O(log n)
    ///
    /// - Parameters:
    ///     - value: The value to be search for in the collection.
    ///     - range: The range to search in the collection.
    ///
    /// - Returns: The index of the value in the collection if found.
    func binarySearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
        let range = range ?? startIndex..<endIndex
        
        guard range.lowerBound < range.upperBound else { return nil }
        
        let middleIndex = index(range.lowerBound, offsetBy: distance(from: range.lowerBound, to: range.upperBound) / 2)
        
        if self[middleIndex] > value {
            return binarySearch(for: value, in: range.lowerBound..<middleIndex)
        } else if self[middleIndex] < value {
            return binarySearch(for: value, in: index(after:
            middleIndex)..<range.upperBound)
        } else {
            return middleIndex
        }
    }
}
