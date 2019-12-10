import Foundation

/// A binary search tree is a special kind of binary tree that performs insertions and deletions such that the tree is always sorted.
public struct BinarySearchTree<T: Comparable> {
    /// The root of the binary search tree.
    public private(set) var root: BinaryTreeNode<T>?
    
    /// Default public initializer.
    public init() {}
}

extension BinarySearchTree {
    
    /// Check if a value is present in the binary search tree.
    ///
    /// - Parameter value: The value to check for.
    /// - Returns: True if the value is in the binary search tree, false otherwise.
    public func contains(_ value: T) -> Bool {
        var current = root
        while let node = current {
            if node.value == value {
                return true
            }
            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
      }
    
    /// Recursively inserts an element into the binarey search tree.
    ///
    /// - Parameter value: The value of the element.
    public mutating func insert(_ value: T) {
      root = insert(from: root, value: value)
    }
    
    /// Recursively inserts an element into the binarey search tree.
    ///
    /// - Parameters:
    ///     - node: The current node to traverse.
    ///     - value: The value to insert in the tree.
    ///
    /// - Returns: The current node.
    private func insert(from node: BinaryTreeNode<T>?, value: T) -> BinaryTreeNode<T> {
        guard let node = node else { return BinaryTreeNode(value) }
        
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
            
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        return node
    }
}
