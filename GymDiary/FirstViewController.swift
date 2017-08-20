//
//  FirstViewController.swift
//  GymDiary
//
//  Created by Luke Sewart on 8/15/17.
//  Copyright © 2017 Luke Sewart. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var tablecell: UITableViewCell!
    @IBOutlet weak var plusButton: UIButton!
    
    var data:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Today"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addExercise))
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
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "tablecell")!
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func addExercise(){
        let name:String = "Row\(data.count + 1)"
        data.insert(name, at:0)
        let indexPath:IndexPath = IndexPath(row: 0, section: 0)
        table.insertRows(at: [indexPath], with: .automatic )
    }
}

