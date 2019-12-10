// Create some nodes
let lion = BinaryTreeNode("Lion")
let tiger = BinaryTreeNode("Tiger")
let elephant = BinaryTreeNode("Elephant")
let hyena = BinaryTreeNode("Hyena")
let meerkat = BinaryTreeNode("Meerkat")
let warthog = BinaryTreeNode("Warthog")

// Assign children
lion.leftChild = tiger
lion.rightChild = elephant
tiger.leftChild = hyena
tiger.rightChild = meerkat
elephant.leftChild = warthog

// Traverse in-order
lion.traverseInOrder { print($0) }

// Traverse pre-order
lion.traversePreOrder { print($0) }

// Traverse post-order
lion.traversePostOrder { print($0) }

// Get the height of the tree
lion.height()
