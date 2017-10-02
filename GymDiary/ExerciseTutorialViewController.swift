//
//  ExerciseTutorial.swift
//  GymDiary
//
//  Created by Lukey Sew on 2/10/17.
//  Copyright © 2017 Luke Sewart. All rights reserved.
//

import Foundation
import UIKit

class ExerciseTutorialViewController: UIViewController
{
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var targetedMusclesLabel: UILabel!
    var name: String!
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
