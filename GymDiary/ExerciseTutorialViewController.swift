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
    @IBOutlet weak var myWebView: UIWebView!
    var vidURL: String! 
    var name: String!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        getVideo(videoCode: mainInstance.realVidURL)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func getVideo(videoCode: String) {
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
            myWebView.loadRequest(URLRequest(url: url!))
    }
}
