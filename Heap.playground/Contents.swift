// Create heap
var numbers = Heap(from: [1, 12, 3, 4, 1, 6, 8, 7], orderCriteria: >)

// Remove elements one by one (Elements should be sorted)
while !numbers.isEmpty {
    if let element = numbers.remove() {
        print(element)
    }
}

// Create new heap
var animals = Heap(from: ["Lion", "Zebra", "Alpaca", "Ferret"], orderCriteria: <)

// Add more elements
animals.insert("Jirafe")
animals.insert("Bear")
animals.insert("Woodchuck")

// Remove elements one by one (Elements should be sorted)
while !animals.isEmpty {
    if let element = animals.remove() {
        print(element)
    }
}

