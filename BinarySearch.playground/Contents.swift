// Create collection
var collection = ["Mount Everest", "Denali", "Mount Fuji", "Mount Kilimanjaro", "K2", "Mont Blanc"]

// Sort collection
collection.sort()

// Search for elements
collection.binarySearch(for: "Mount Kilimanjaro")
collection.binarySearch(for: "Lhotse")
collection.binarySearch(for: "Mount Fuji", in: 0..<3)
