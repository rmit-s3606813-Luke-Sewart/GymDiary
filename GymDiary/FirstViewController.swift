//
//  FirstViewController.swift
//  GymDiary
//
//  Created by Luke Sewart on 8/15/17.
//  Copyright © 2017 Luke Sewart. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
        
    }
    
    
    var data:[String] = []
    var cardioCells = [cardioCell()]
    var weightCells = [weightCell()]
    var cardioCount = 0
    var weightCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

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
            cell.TimeInput = cardioCells[cardioCount].TimeInput
            cell.DistanceInput = cardioCells[cardioCount].DistanceInput
            cell.difficultySlider = cardioCells[cardioCount].difficultySlider
            return cell

        }
        else if data[indexPath.row] == "weightCell"
        {
            let cell = Bundle.main.loadNibNamed("weightCell", owner:self,
                                                options:  nil)?.first as! weightCell
            cell.exerciseInput = weightCells[weightCount].exerciseInput
            cell.weightInput = weightCells[weightCount].weightInput
            cell.difficultySlider = weightCells[weightCount].difficultySlider
            cell.setsInput = weightCells[weightCount].setsInput
            cell.repsInput = weightCells[weightCount].repsInput
            return cell


        }
        else
        {
        let cell = Bundle.main.loadNibNamed("cardioCell", owner:self,
                                            options:  nil)?.first as! cardioCell
        cell.TimeInput = cardioCells[cardioCount].TimeInput
        cell.DistanceInput = cardioCells[cardioCount].DistanceInput
        cell.difficultySlider = cardioCells[cardioCount].difficultySlider
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
    
    
}
