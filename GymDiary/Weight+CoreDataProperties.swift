//
//  Weight+CoreDataProperties.swift
//  GymDiary
//
//  Created by Lukey Sew on 25/9/17.
//  Copyright © 2017 Luke Sewart. All rights reserved.
//

import Foundation
import CoreData


extension Weight {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Weight> {
        return NSFetchRequest<Weight>(entityName: "Weight")
    }

    @NSManaged public var difficulty: Int64
    @NSManaged public var exercise: String?
    @NSManaged public var reps: String?
    @NSManaged public var sets: String?
    @NSManaged public var weight: String?

}
