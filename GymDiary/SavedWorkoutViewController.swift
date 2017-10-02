//
//  FourthViewController.swift
//  GymDiary
//
//  Created by Lukey Sew on 19/8/17.
//  Copyright © 2017 Luke Sewart. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation

class SavedWorkoutViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var degreesTextLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var cityTextLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    //workoutCount initialized, is updated upon viewDidLoad and reloadTableData functions, used to pass to function
    //tableView (numberOfRowsInSection), returning workoutCount and the correct number of rows for tableView
    var workoutCount = 0
    let forecastAPIKey = "70374cf80a30b9355bb3a02f97917112"
    var coordinate: (lat: Double, long: Double) = (-37.718772, 144.816893)
    var forecast: Forecast!
    var locManager = CLLocationManager()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        locManager.delegate = self
        locManager.requestAlwaysAuthorization()
        locManager.requestWhenInUseAuthorization()
        locManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        if(CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
        CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways)
        {
            coordinate.lat = (locManager.location?.coordinate.latitude)!
            coordinate.long = (locManager.location?.coordinate.longitude)!
        }
        forecast = Forecast(APIKey: forecastAPIKey)
        forecast.getCurrentWeather(latitude: coordinate.lat, longitude: coordinate.long)
        {   (currentWeather) in
            if let currentWeather = currentWeather{
                    DispatchQueue.main.async{
                        if let temperature = currentWeather.temperature{
                        self.degreesTextLabel.text = "\(temperature)°"
                        }
                        else{
                            self.degreesTextLabel.text = "-"
                        }
                        if let city = currentWeather.location{
                            var myStringArr = city.components(separatedBy: "/")
                            let count = myStringArr.count
                            let newString = myStringArr[count-1].replacingOccurrences(of: "_", with: " ")
                            self.cityTextLabel.text = newString
                        }
                        else{
                            self.cityTextLabel.text = "-"
                        }
                        if let icon = currentWeather.icon{
                            self.weatherImage.image = UIImage(named: icon)
                        }
                        else{
                            self.weatherImage.image = UIImage(named: "clear-day")
                        }
                        if let summary = currentWeather.summary{
                            self.summaryLabel.text = summary
                        }
                        else {
                            self.summaryLabel.text = "-"
                        }
                        
                }
            }
        }
        
        
            //add observer that reloads table view on this page when a new workout has been added from 'Add Workout' screen
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableData), name: NSNotification.Name(rawValue: "loadTableView"), object: nil)
            //create fetch request referencing the Workout Core Data entity
        let fetchRequest:NSFetchRequest<Workout> = Workout.fetchRequest()
            //instance of appDelegate created in order to reference persistent container and Core Data
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
            //do block tries to fetch any Workout entities held in Core Data, and returns them as 'searchResults', an array of type [Workout]
            //also prints number of results: 
        //***USEFUL FOR WORK IN PROGRESS, CAN BE DELETED UPON BUG FIXING****
        do{
        let searchResults = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
            print("number of results : \(searchResults.count)")
            workoutCount = searchResults.count
            for result in searchResults as [Workout]
            {
                                            //BELOW COMMENTS USED TO CLEAR CORE DATA, WHEN FRESH START NEEDED UNCOMMENT FOLLOWING COMMENTS
                            //appDelegate.persistentContainer.viewContext.delete(result)
                            //appDelegate.saveContext()
                print("\(result.workoutName!)")
                
            }
        } catch {
            print("Error: \(error)")
        }
        print(coordinate)
    }
    
    //reloadTableData is called upon a notification being sent from Add Workout view controller, and should update the tableView to include a new row
    //that was created upon saving a new workout on that tab
    func reloadTableData(notification: NSNotification){
        let fetchRequest:NSFetchRequest<Workout> = Workout.fetchRequest()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        do{
            let searchResults = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
            workoutCount = searchResults.count
        } catch {
            print("Error: \(error)")
        }
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //f0.unction that passes the tableView and indexPath, and asks for a return of type UITableViewCell,
    //this function will run the numberOfRowsInSection functions return count. And expects a table cell to be returned for each cell
    //in the table to be displayed
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = Bundle.main.loadNibNamed("savedWorkoutCell", owner:self,
                    options:  nil)?.first as! savedWorkoutCell
        let fetchRequest:NSFetchRequest<Workout> = Workout.fetchRequest()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        do
        {
            let searchResults = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
            cell.label.text = searchResults[indexPath.row].workoutName
        }
        catch
        {
            print("Error: \(error)")
        }
        return cell
    }
    
    //function returns number of table view cells to be displayed, based upon the amount of workouts available in Core Data
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return workoutCount
    }
    
    //function that runs upon user tapping a table cell. Also passes the indexPath of the table cell that is tapped, useful in order to have meaningful data based upon user input
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let DetailViewController = storyboard?.instantiateViewController(withIdentifier: "WorkoutDetailViewController") as! workoutDetailViewController
        DetailViewController.index = indexPath.row
        navigationController?.pushViewController(DetailViewController, animated:true)
        
    }
    
    
}

