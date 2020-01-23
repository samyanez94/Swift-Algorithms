// Create priority queue
var queue = PriorityQueue(elements: ["Dracaena", "Calatheas", "Orchids", "Fig trees", "Philodendron", "Spider plant", "Cactus", "Palm trees"], orderCriteria: >)

// Add some more elements to the queue
queue.enqueue("Jade plant")
queue.enqueue("Bamboo")
queue.enqueue("Succulent")

// Dequeue elements. (Elements should be in ascensing order given the order criteria.)
while !queue.isEmpty {
    if let element = queue.dequeue() {
        print(element)
    }
}
