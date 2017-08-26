//
//  DetailViewController.swift
//  GymDiary
//
//  Created by Lukey Sew on 26/8/17.
//  Copyright © 2017 Luke Sewart. All rights reserved.
//


import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Label1.numberOfLines = 0
        Label2.numberOfLines = 0
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func returnNumber()->Int {
        return 5;
    }
    
}

