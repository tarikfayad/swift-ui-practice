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

#Preview {
    ContentView()
        .modelContainer(for: [Item.self], inMemory: true) // Saving the items in memory
}
