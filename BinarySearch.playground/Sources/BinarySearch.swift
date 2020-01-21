import Foundation

/**
 Binary search is a search algorithm that recursively splits the array in half until the value is found.
*/
public extension RandomAccessCollection where Element: Comparable {
    func binarySearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
        let range = range ?? startIndex..<endIndex
        if range.lowerBound >= range.upperBound {
            return nil
        } else {
            let size = distance(from: range.lowerBound, to: range.upperBound)
            let middleIndex = index(range.lowerBound, offsetBy: size / 2)
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
}
