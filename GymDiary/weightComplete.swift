//
//  weightComplete.swift
//  GymDiary
//
//  Created by Lukey Sew on 19/9/17.
//  Copyright © 2017 Luke Sewart. All rights reserved.
//

import UIKit

class weightComplete: UITableViewCell {

    @IBOutlet weak var exerciseLabel: UILabel!
    
    @IBOutlet weak var setsLabel: UILabel!
    
    @IBOutlet weak var repsLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var difficulty: UISlider!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
