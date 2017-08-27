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
        if indexPath.row % 5 == 1
        {
            cell.backgroundColor = UIColor(red: 124/255, green: 255/255, blue: 154/255, alpha: 1)
            
        }
        else if indexPath.row % 5 == 2
        {
            cell.backgroundColor = UIColor(red: 232/255, green: 225/255, blue: 134/255, alpha: 1)
            
        }
        else if indexPath.row % 5 == 3
        {
            cell.backgroundColor = UIColor(red: 255/255, green: 142/255, blue: 55/255, alpha: 1)
            
        }
        else if indexPath.row % 5 == 4
        {
            cell.backgroundColor = UIColor(red: 124/255, green: 62/255, blue: 182/255, alpha: 1)
            
        }
        else
        {
            cell.backgroundColor = UIColor(red: 124/255, green: 129/255, blue: 255/255, alpha: 1)
        }
        
        return cell
    }
}

