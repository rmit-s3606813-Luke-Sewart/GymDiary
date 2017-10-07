//
//  ExerciseTut.swift
//  GymDiary
//
//  Created by Lukey Sew on 2/10/17.
//  Copyright © 2017 Luke Sewart. All rights reserved.
//

import Foundation

class ExerciseTut
{
    let name: String
    let targetedMuscles: String
    let description: String
    let imageName: String
    let vidURL: String
    
    init(name: String, targetedMuscles: String, description: String, imageName: String, vidURL: String)
    {
        self.name = name
        self.targetedMuscles = targetedMuscles
        self.description = description
        self.imageName = imageName
        self.vidURL = vidURL
    }
}
