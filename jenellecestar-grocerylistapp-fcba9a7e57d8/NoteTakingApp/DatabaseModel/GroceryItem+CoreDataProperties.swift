//
//  GroceryItem+CoreDataProperties.swift
//  NoteTakingApp
//
//  Created by MacStudent on 2018-07-11.
//  Copyright © 2018 robin. All rights reserved.
//
//

import Foundation
import CoreData


extension GroceryItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroceryItem> {
        return NSFetchRequest<GroceryItem>(entityName: "GroceryItem")
    }

    @NSManaged public var dateAdded: NSDate?
    @NSManaged public var itemName: String?

}
