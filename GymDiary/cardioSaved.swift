//
//  cardioSaved.swift
//  GymDiary
//
//  Created by Lukey Sew on 26/9/17.
//  Copyright © 2017 Luke Sewart. All rights reserved.
//

import UIKit

class cardioSaved: UITableViewCell {

    @IBOutlet weak var difficulty: UISlider!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
