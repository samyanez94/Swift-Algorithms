import Foundation

/**
 A tree is a data structure of profound importance that represents hierarchical relationships between objects. A tree consists of nodes, and these nodes are linked to one another.
*/
public class TreeNode<Element> {
    
    /// The value of the node.
    public var value: Element
    
    /// The parent of the node in the tree.
    public weak private(set) var parent: TreeNode?

    /// The list of children nodes.
    public var children: [TreeNode<Element>] = []
    
    /// Default public initializer.
    public init(_ value: Element) {
        self.value = value
    }
    
    /// Adds a node as a child to this node in the tree.
    ///
    /// - Complexity: O(1)
    ///
    /// - Parameter child: The child node to be added.
    public func add(_ child: TreeNode) {
        child.parent = self
        children.append(child)
    }
}

extension TreeNode: CustomStringConvertible {
    public var description: String {
        var string = "\(value)"
        if !children.isEmpty {
            string += " {" + children.map { $0.description }.joined(separator: ", ") + "}"
        }
        return string
    }
}
