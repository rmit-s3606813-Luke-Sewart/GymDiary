//
//  weightCell.swift
//  GymDiary
//
//  Created by Lukey Sew on 21/8/17.
//  Copyright © 2017 Luke Sewart. All rights reserved.
//

import UIKit

class weightCell: UITableViewCell {

   
    
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var exerciseInput: UITextField!
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var setsInput: UITextField!
    @IBOutlet weak var repsInput: UITextField!
    @IBOutlet weak var difficultySlider: UISlider!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
