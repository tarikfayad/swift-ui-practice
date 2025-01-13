//
//  WishModel.swift
//  Wishlist
//
//  Created by Tarik Fayad on 1/13/25.
//

import Foundation
import SwiftData

@Model
class Wish: Identifiable {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
