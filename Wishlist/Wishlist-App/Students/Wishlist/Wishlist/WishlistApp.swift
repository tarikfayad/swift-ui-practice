//
//  WishlistApp.swift
//  Wishlist
//
//  Created by Tarik Fayad on 1/13/25.
//

import SwiftUI
import SwiftData

@main
struct WishlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Wish.self)
        }
    }
}
