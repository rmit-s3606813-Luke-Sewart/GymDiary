//
//  StopwatchViewController.swift
//  GymDiary
//
//  Created by Jordan Tori on 19/8/17.
//  Copyright © 2017 Luke Sewart. All rights reserved.
//

import UIKit

class StopwatchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var totalSec: Float = 0
    var timer = Timer()
    var lapTimeArray = [String]()
    var timerRunning: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = "00:00:00"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startButtonTapped(_ sender: AnyObject) {
        if timerRunning == false {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
            timerRunning = true
        }
    }
    
    @IBAction func stopButtonTapped(_ sender: AnyObject) {
        timer.invalidate()
        timerRunning = false
        lapTimeArray.removeAll()
        totalSec = 0
    }
    
    @IBAction func lapButtonTapped(_ sender: AnyObject) {
        lapTimeArray.append(timerLabel.text!)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lapRecordCell")
        cell?.textLabel?.text = lapTimeArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lapTimeArray.count
    }
    
    func updateTimer(){
        totalSec += 0.01
        let totalSecMulti100:Int = Int(totalSec*100)
        let min = Int(totalSec/60)
        let hour = Int(min/60)
        let minStr = (min == 0) ? "00" : "\(min)"
        let hourStr = (hour == 0) ? "00" : "\(hour)"
        let secStr = (totalSec < 9) ? "0\(Float(totalSecMulti100)/100)" : "\(Float(totalSecMulti100)/100)"
        timerLabel.text = "\(hourStr):\(minStr):\(secStr)"
    }
    
    
    
    
}

