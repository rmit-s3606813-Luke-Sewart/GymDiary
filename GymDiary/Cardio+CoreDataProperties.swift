//
//  Cardio+CoreDataProperties.swift
//  GymDiary
//
//  Created by Lukey Sew on 25/9/17.
//  Copyright © 2017 Luke Sewart. All rights reserved.
//

import Foundation
import CoreData


extension Cardio {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cardio> {
        return NSFetchRequest<Cardio>(entityName: "Cardio")
    }

    @NSManaged public var difficulty: Int64
    @NSManaged public var distance: String?
    @NSManaged public var time: String?

}
