//
//  ContentView.swift
//  Wishlist
//
//  Created by Tarik Fayad on 1/13/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
                }
            }
            .navigationTitle("Wishlist")
            .overlay{
                if wishes.isEmpty {
                    ContentUnavailableView("My Wishlist", systemImage: "heart.circle", description: Text("No wishes yet. Add one to get started!"))
                }
            }
//            .onAppear {
//                modelContext.fetch()
//            }
        }
    }
}

#Preview("Full List") {
    
    // Sample data to show a screen with a full list
    let container = try! ModelContainer(for: Wish.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    container.mainContext.insert(Wish(title: "First Wish"))
    container.mainContext.insert(Wish(title: "Second Wish"))
    container.mainContext.insert(Wish(title: "Third Wish"))
    container.mainContext.insert(Wish(title: "Fourth Wish"))
    container.mainContext.insert(Wish(title: "Fifth Wish"))
    
    return ContentView()
        .modelContainer(container)
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true) // Preview objects are simply held in memory. Not Saved.
}
