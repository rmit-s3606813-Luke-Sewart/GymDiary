//
//  FirstViewController.swift
//  GymDiary
//
//  Created by Luke Sewart on 8/15/17.
//  Copyright © 2017 Luke Sewart. All rights reserved.
//

import UIKit
import CoreData

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    let filemanager = FileManager.default
    var textField:String = ""
    var workoutCount = 0
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var weightButton: UIButton!
    @IBOutlet weak var cardioButton: UIButton!
    @IBOutlet weak var table: UITableView!
    @IBAction func weightButtonTapped(_ sender: Any) {
        data.insert("weightCell", at: 0)
        addExercise()
    }
   
    @IBAction func cardioButtonTapped(_ sender: Any) {
        data.insert("cardioCell", at: 0)
        addExercise()
    }
   
    @IBAction func saveWorkoutTapped(_ sender: Any) {
        
        textField = showInputAlert()
    }
    
    
    func showInputAlert() -> String{
        let alertController = UIAlertController(title: "Enter Workout Name", message: nil, preferredStyle: .alert)
        alertController.addTextField{ (textField) in textField.text = "Monday"}
        alertController.addAction(UIAlertAction(title: "Confirm", style: .default) { (_) in
        self.textField = (alertController.textFields?[0].text)!
        self.saveTableData()})
        self.present(alertController, animated: true, completion: nil)
                    return textField
    }
    
    func saveTableData(){
        var cardioCount = 0
        var weightCount = 0
        let context = appDelegate.persistentContainer.viewContext
        let workout:Workout = NSEntityDescription.insertNewObject(forEntityName: "Workout", into: context) as! Workout
        workoutCount += 1
        workout.workoutName = textField
        for i in 0..<data.count
        {
            if data[i] == "cardioCell"
            {
                
                let cardioCell:Cardio = NSEntityDescription.insertNewObject(forEntityName: "Cardio", into: context) as! Cardio
                cardioCell.distance = cardioCells[cardioCount].DistanceInput.text!
                cardioCell.time = cardioCells[cardioCount].TimeInput.text!
                cardioCell.difficulty = Int64(cardioCells[cardioCount].difficultySlider.value)
                workout.addToHas(cardioCell)
                cardioCount += 1
            }
            else if data[i] == "weightCell"
            {
                let weightCell:Weight = NSEntityDescription.insertNewObject(forEntityName: "Weight", into: context) as! Weight
                weightCell.exercise = weightCells[weightCount].exerciseInput.text!
                weightCell.weight = weightCells[weightCount].weightInput.text!
                weightCell.sets = weightCells[weightCount].setsInput.text!
                weightCell.reps = weightCells[weightCount].repsInput.text!
                weightCell.difficulty = Int64(weightCells[weightCount].difficultySlider.value)
                workout.addToHas(weightCell)
                weightCount += 1
            }
            else
            {
                print("ERROR: Save Workout else statement has been executed")
            }
        }
        cardioCells = []
        weightCells = []
        data = []
        table.reloadData()
        appDelegate.saveContext()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadTableView"), object:nil)

    }
    
        // FILE WRITING, IMPLEMENTING CORE DATA INSTEAD
    
//        let fileName = "workout" + String(fileCount)
//        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
//        print("filePath: \(fileURL.path)")
//        var cardioCount = 0
//        var weightCount = 0
//        for i in 0..<data.count
//        {
//            if data[i] == "cardioCell"
//            {
//                let time = cardioCells[cardioCount].TimeInput.text!
//                let distance = cardioCells[cardioCount].DistanceInput.text!
//                let difficulty = cardioCells[cardioCount].difficultySlider.value
//                let joinedString = "cardioCell," + time + "," + distance + "," + String(difficulty) + "\n"
//                let fileNamedString = fileName + "\n"
//                let workoutName = fileNamedString.data(using: .utf8, allowLossyConversion: false)!
//                let string = joinedString.data(using: .utf8, allowLossyConversion: false)!
//                try! workoutName.write(to: fileURL, options: Data.WritingOptions.atomic)
//                if FileManager.default.fileExists(atPath: fileURL.path) {
//                    if let fileHandle = try? FileHandle(forUpdating: fileURL)
//                    {
//                        fileHandle.seekToEndOfFile()
//                        fileHandle.write(string)
//                        fileHandle.closeFile()
//                    }
//                }
//                else {
//
//                    try! string.write(to: fileURL, options: Data.WritingOptions.atomic)
//                }
//                cardioCount += 1
//            }
//            else if data[i] == "weightCell"
//            {
//                let exercise = weightCells[weightCount].exerciseInput.text!
//                let weight = weightCells[weightCount].weightInput.text!
//                let difficulty = weightCells[weightCount].difficultySlider.value
//                let sets = weightCells[weightCount].setsInput.text!
//                let reps = weightCells[weightCount].repsInput.text!
//                let joinedString = "weightCell," + exercise + "," + weight + "," + String(difficulty) + "," + sets + "," + reps + "\n"
//                let fileNamedString = fileName + "\n"
//                let workoutName = fileNamedString.data(using: .utf8, allowLossyConversion: false)!
//                try! workoutName.write(to: fileURL, options: Data.WritingOptions.atomic)
//                let string = joinedString.data(using: .utf8, allowLossyConversion: false)!
//                if FileManager.default.fileExists(atPath: fileURL.path) {
//                    if let fileHandle = try? FileHandle(forUpdating: fileURL)
//                    {
//                        fileHandle.seekToEndOfFile()
//                        fileHandle.write(string)
//                        fileHandle.closeFile()
//                    }
//                }
//                else {
//                    try! string.write(to: fileURL, options: Data.WritingOptions.atomic)
//                }
//                weightCount += 1
//            }
//            else
//            {
//                print("type not found /  end of data without breaking loop")
//            }
//        }
//        data = []
//        table.reloadData()
//        fileCount += 1
        
        
        
        
        
        
        
    
    var data:[String] = []
    var cardioCells = [cardioCell()]
    var weightCells = [weightCell()]
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if data[indexPath.row] == "cardioCell"
        {
            let cell = Bundle.main.loadNibNamed("cardioCell", owner:self,
                        options:  nil)?.first as! cardioCell
            cardioCells.insert(cell, at:0)
            return cell

        }
        else if data[indexPath.row] == "weightCell"
        {
            let cell = Bundle.main.loadNibNamed("weightCell", owner:self,
                                                options:  nil)?.first as! weightCell
            weightCells.insert(cell, at: 0)
            return cell
        }
        else
        {
        let cell = Bundle.main.loadNibNamed("cardioCell", owner:self,
                                            options:  nil)?.first as! cardioCell
        print("invalid cell created")
        return cell
        }
    }
    func addExercise(){
        let indexPath:IndexPath = IndexPath(row: 0, section: 0)
        table.insertRows(at: [indexPath], with: .automatic )
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if data[indexPath.row] == "cardioCell"
        {
            return 110
            
        }
        else if data[indexPath.row] == "weightCell"
        {
           
            return 130
            
        }
        else
        {
            return 130
        }
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            data.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    
}
