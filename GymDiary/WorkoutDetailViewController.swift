//
//  WorkoutDetailViewController.swift
//  GymDiary
//
//  Created by Lukey Sew on 24/9/17.
//  Copyright © 2017 Luke Sewart. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class workoutDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    var index = Int()
    var cellCount = Int()
    let fetchRequest:NSFetchRequest<Workout> = Workout.fetchRequest()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var NSArray = NSOrderedSet()
    var cellArray : [Exercise] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        do
        {
            let searchResults = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
            NSArray = searchResults[index].has!
            cellCount = NSArray.count
            print ("Count of the NSOrderedSet array:" + String(cellCount))
            for object in NSArray
            {
                cellArray.append(object as! Exercise)
            }
            print("Cell array count should match previous count:" + String(cellArray.count))
        } catch {
            print("Error: \(error)")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return cellCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let exercise = cellArray[indexPath.row] as? Cardio
        {
            let cell = Bundle.main.loadNibNamed("cardioSaved", owner:self,
                                                options:  nil)?.first as! cardioSaved
            cell.distanceLabel.text = exercise.distance
            cell.timeLabel.text = exercise.time
            cell.difficulty.value = Float(exercise.difficulty)
            return cell
        }
        else if let exercise = cellArray[indexPath.row] as? Weight
        {
            let cell = Bundle.main.loadNibNamed("weightComplete", owner:self,
                                                options:  nil)?.first as! weightComplete
            cell.exerciseLabel.text = exercise.exercise
            cell.setsLabel.text = exercise.sets
            cell.repsLabel.text = exercise.reps
            cell.weightLabel.text = exercise.weight
            cell.difficulty.value = Float(exercise.difficulty)
            return cell
        }
        else
        {
            let cell = UITableViewCell()
            print("cell not recognized as cardio or weight")
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if ((cellArray[indexPath.row] as? Cardio) != nil)
        {
            return 90
            
        }
        else if ((cellArray[indexPath.row] as? Weight) != nil)
        {
            
            return 120
            
        }
        else
        {
            return 130
        }
        
    }
}
