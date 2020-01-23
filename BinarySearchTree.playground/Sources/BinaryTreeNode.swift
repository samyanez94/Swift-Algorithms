import Foundation

/**
 A binary tree is a tree data structure in which each node has at most two children, which are referred to as the left child and the right child.
 */
public class BinaryTreeNode<T> {
    /// The value of the node.
    public var value: T
    
    /// The parent of the node in the tree.
    public weak private(set) var parent: BinaryTreeNode?
    
    /// The left child of the node in the tree.
    public var leftChild: BinaryTreeNode? {
        didSet {
            leftChild?.parent = self
        }
    }
    
    /// The right child of the node in the tree.
    public var rightChild: BinaryTreeNode? {
        didSet {
            rightChild?.parent = self
        }
    }
    
    /// Computed property that true if the node is a left child.
    public var isLeftChild: Bool {
      return parent?.leftChild === self
    }

    /// Computed property that true if the node is a right child.
    public var isRightChild: Bool {
      return parent?.rightChild === self
    }
    
    /// Computed property that returns the node with the minimum value in the tree.
    var min: BinaryTreeNode {
        return leftChild?.min ?? self
    }
    
    /// Default public initializer.
    public init(_ value: T) {
        self.value = value
    }
}

extension BinaryTreeNode {
    /// Performs an in-order traversal of the tree.
    ///
    /// - Complexity: O(n)
    ///
    /// - Parameter visit: Closure to execute for each node as it is visited.
    public func traverseInOrder(visit: (T) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    /// Performs a pre-order traversal of the tree.
    ///
    /// - Complexity: O(n)
    ///
    /// - Parameter visit: Closure to execute for each node as it is visited.
    public func traversePreOrder(visit: (T) -> Void) {
        visit(value)
        leftChild?.traverseInOrder(visit: visit)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    /// Performs a post-order traversal of the tree.
    ///
    /// - Complexity: O(n)
    ///
    /// - Parameter visit: Closure to execute for each node as it is visited.
    public func traversePostOrder(visit: (T) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        rightChild?.traverseInOrder(visit: visit)
        visit(value)
     }
}

extension BinaryTreeNode {
    /// Returns the height of the tree. The height is the distance to the lowest leaf
    ///
    /// - Complexity: O(n)
    ///
    /// - Returns: The height of the tree.
    public func height() -> Int {
        return 1 + max(leftChild?.height() ?? 0, rightChild?.height() ?? 0)
    }
}
