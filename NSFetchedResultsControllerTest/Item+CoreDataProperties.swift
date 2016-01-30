//
//  Item+CoreDataProperties.swift
//  NSFetchedResultsControllerTest
//
//  Created by Ilia Tikhomirov on 29/01/16.
//  Copyright © 2016 Ilia Tikhomirov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Item {

    @NSManaged var done: NSNumber?
    @NSManaged var name: String?
    @NSManaged var createdAt: String?

}
