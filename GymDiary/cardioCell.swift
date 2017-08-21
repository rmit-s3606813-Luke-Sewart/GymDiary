//
//  cardioCell.swift
//  GymDiary
//
//  Created by Lukey Sew on 21/8/17.
//  Copyright © 2017 Luke Sewart. All rights reserved.
//

import UIKit

class cardioCell: UITableViewCell {

    @IBOutlet weak var TimeInput: UITextField!
    @IBOutlet weak var DistanceInput: UITextField!
    @IBOutlet weak var difficultySlider: UISlider!
    @IBOutlet weak var difficulty: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
