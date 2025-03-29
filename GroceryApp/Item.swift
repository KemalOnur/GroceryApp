//
//  Item.swift
//  GroceryApp
//
//  Created by Kemal Onur Güngör on 29.03.2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var grocery_Item: String
    
    init(grocery_Item: String) {
        self.grocery_Item = grocery_Item
    }
}
