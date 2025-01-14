//
//  Item.swift
//  Grocery List
//
//  Created by Tarik Fayad on 1/14/25.
//

import Foundation
import SwiftData

@Model
class Item {
    var title: String
    var isComplete: Bool
    
    init(title: String, isComplete: Bool) {
        self.title = title
        self.isComplete = isComplete
    }
}
