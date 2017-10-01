//
//  Exercise+CoreDataProperties.swift
//  GymDiary
//
//  Created by Lukey Sew on 25/9/17.
//  Copyright © 2017 Luke Sewart. All rights reserved.
//

import Foundation
import CoreData


extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var partOf: Workout?

}
