//
//  SecondViewController.swift
//  GymDiary
//
//  Created by Luke Sewart on 8/15/17.
//  Copyright © 2017 Luke Sewart. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    var array = [String]()
    
    @IBAction func cellTapped(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        array = ["Bicep Curl","Tricep Pulldown","Leg Press","Push Up","Lat Pulldown","Chest Press","Sit Up","Chest Fly","Shoulder Press","DeadLlift","Leg Curl","Pull Up"]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as UICollectionViewCell
        let Button = cell.viewWithTag(1) as! UIButton
        Button.setTitle(array[indexPath.row], for: UIControlState.normal)
        return cell
    }
}

