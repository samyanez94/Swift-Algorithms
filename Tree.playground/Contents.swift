// Create the tree root
let tree = TreeNode("Rickard Stark")

// Create some more nodes
let brandon = TreeNode("Brandon Stark")
let eddard = TreeNode("Eddard Stark")
let benjen = TreeNode("Benjen Stark")
let lyanna = TreeNode("Lyanna Stark")

// Add nodes to the tree
tree.add(brandon)
tree.add(eddard)
tree.add(benjen)
tree.add(lyanna)

// Lets create even more nodes
let robb = TreeNode("Robb Stark")
let sansa = TreeNode("Sansa Stark")
let arya = TreeNode("Arya Stark")
let bran = TreeNode("Bran Stark")
let rickon = TreeNode("Rickon Stark")

eddard.add(robb)
eddard.add(sansa)
eddard.add(arya)
eddard.add(bran)
eddard.add(rickon)

// Creat Jon Snow
let jon = TreeNode("Jon Snow")

// Add Jon Snow
lyanna.add(jon)

// Print the tree
print(tree)






