//
//  Workout+CoreDataProperties.swift
//  GymDiary
//
//  Created by Lukey Sew on 25/9/17.
//  Copyright © 2017 Luke Sewart. All rights reserved.
//

import Foundation
import CoreData


extension Workout {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Workout> {
        return NSFetchRequest<Workout>(entityName: "Workout")
    }

    @NSManaged public var workoutName: String?
    @NSManaged public var has: NSOrderedSet?

}

// MARK: Generated accessors for has
extension Workout {

    @objc(addHasObject:)
    @NSManaged public func addToHas(_ value: Exercise)

    @objc(removeHasObject:)
    @NSManaged public func removeFromHas(_ value: Exercise)

    @objc(addHas:)
    @NSManaged public func addToHas(_ values: NSOrderedSet)

    @objc(removeHas:)
    @NSManaged public func removeFromHas(_ values: NSOrderedSet)

}
