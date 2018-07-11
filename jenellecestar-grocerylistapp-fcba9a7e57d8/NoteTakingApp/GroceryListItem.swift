//
//  Note.swift
//  NoteTakingApp
//
//  Created by robin on 2018-07-09.
//  Copyright © 2018 robin. All rights reserved.
//

import Foundation

class GroceryListItem {
    
    let dateAdded : Date
    var itemName: String
    
    init(item: String) {
        self.dateAdded = Date()
        self.itemName = item
    }
}
