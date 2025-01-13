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
    
    @State private var showAddWishSheet = false
    @State private var newWishTitle: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(wish)
                            }
                        }
                }
            }
            .navigationTitle("Wishlist")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddWishSheet = true
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
            }
            .alert("Create a New Wish", isPresented: $showAddWishSheet) {
                TextField("Enter a wish!", text: $newWishTitle)
                
                Button {
                    modelContext.insert(Wish(title: newWishTitle))
                    newWishTitle = "" // Resetting the input value after saving the item.
                } label:{
                    Text("Save")
                }.padding()
                
                Button(role: .cancel) {
                } label:{
                    Text("Cancel")
                }.padding()
            }
            .overlay{
                if wishes.isEmpty {
                    ContentUnavailableView("My Wishlist", systemImage: "heart.circle", description: Text("No wishes yet. Add one to get started!"))
                }
            }
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
