//
//  ContentView.swift
//  Grocery List
//
//  Created by Tarik Fayad on 1/13/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var groceryItems: [Item] // Query to pull all the items saved in SwiftData
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(groceryItems) { item in
                    Text(item.title)
                }
            }
            .navigationTitle("Grocery List")
            .overlay{
                if groceryItems.isEmpty {
                    ContentUnavailableView("Empty Cart", systemImage: "cart.circle", description: Text("Add some items to the shopping list."))
                }
            }
        }
    }
}

#Preview("Sample Data") {
    let sampleItems: [Item] = [
        .init(title: "Apples", isComplete: true),
        .init(title: "Bananas", isComplete: false),
        .init(title: "Oranges", isComplete: .random()),
        .init(title: "Peaches", isComplete: .random()),
        .init(title: "Watermelon", isComplete: .random()),
    ]
    
    let container = try! ModelContainer(for: Item.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    for item in sampleItems {
        container.mainContext.insert(item)
    }
    
    return ContentView()
        .modelContainer(container)
}

#Preview ("Empty List"){
    ContentView()
        .modelContainer(for: [Item.self], inMemory: true) // Saving the items in memory
}
