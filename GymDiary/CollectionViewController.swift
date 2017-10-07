//
//  SecondViewController.swift
//  GymDiary
//
//  Created by Luke Sewart on 8/15/17.
//  Copyright © 2017 Luke Sewart. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    var exerciseTuts =
    [
        ExerciseTut(name: "Bicep Curls", targetedMuscles: "Biceps", description: "Stand up straight with a dumbbell in each hand at arm's length. Keep your elbows close to your torso and rotate the palms of your hands until they are facing forward. This will be your starting position. Now, keeping the upper arms stationary, exhale and curl the weights while contracting your biceps.", imageName: "bicep-curl", vidURL: "3OZ2MT_5r3Q"),
        ExerciseTut(name: "Tricep Pulldown", targetedMuscles: "Triceps\n Deltoids" ,description: "Hold a single dumbbell with both your hands, wrapping your fingers around the end. Your palms should be facing up. Lift your hands with the dumbbell over your head until your arms are nearly straight, then curl the arms back down behind your head in a controlled movement. Perform the movement slowly. Before contracting triceps and extending arms back to starting position.", imageName: "tricep-curl", vidURL: "0lUqSBmaRME"),
        ExerciseTut(name: "Leg Press", targetedMuscles: "Quadriceps\nCalf muscles\n Hamstrings",description: "Lower the safety bars holding the weighted platform in place and press the platform all the way up until your legs are fully extended in front of you. Make sure that you do not lock your knees. Your torso and the legs should make a perfect 90-degree angle. This will be your starting position. Slowly  lower the platform until your upper and lower legs make a 90-degree angle. Then maintain control and push the platform back to starting position", imageName: "leg-press", vidURL: "3R0SOJ3alTA"),
        ExerciseTut(name: "Push Up", targetedMuscles: "Pectorals\n Deltoids \n Triceps",description: "Lie on the floor face down and place your hands should width apart. Lower yourself until your chest almost touches the floor. Press your uppder body back up to starting position.", imageName: "push-up", vidURL: "XIHO5t_VBPQ"),
        ExerciseTut(name: "Lat Pulldown", targetedMuscles: "Latissimus Dorsi",description: "Keep your chest as high as your can. Keep your elbows pointed downwards. Grab the bar at a little wider than shoulder width apart. Squeeze your lats as you pull the bar towards your chest, stopping around the height of your chin. Before maintaining control and returning to starting position", imageName: "lat-pulldown", vidURL: "lueEJGjTuPQ"),
        ExerciseTut(name: "Chest Press", targetedMuscles: "Pectorals\nBiceps\nTriceps\nDeltoids",description: "Lie on the bench with a dumbell in each hand and feet flat on the floor. Hold dumbells upwards with your arms horizontal and a 90 degree angle at your elbow. Push the dumbells up so that they are above your shoulders and palms are facing up. Maintain control and reverse motion to return to starting position.", imageName: "chest-press", vidURL: "RsobeWfbBcY"),
        ExerciseTut(name: "Sit Up", targetedMuscles: "Abdominals",description: "Bend your knees with the balls of your feet flat on the ground. Cross your arms over your chest. Tighten your abdominal muscles and lift your upper body towards your knees. Return slowly while contracting abdominals to starting position.", imageName: "sit-up", vidURL: "10mp1wusuzM"),
        ExerciseTut(name: "Chest Fly", targetedMuscles: "Pectorals\nBiceps\nTriceps\nDeltoids",description: "Begin by holding dumbbells straight up in the air, with your palms facing inwards to each other. Lower the weights to your sides while keeping arms slightly bent. Keep elbows slightly bent and slowly return to starting position.", imageName: "chest-fly", vidURL: "QwuUZ5wgQOk"),
        ExerciseTut(name: "Shoulder Press", targetedMuscles: "Deltoids\nTriceps\nBiceps",description: "Use a chair with back support and hold a dumbbell in each hand with arms horizontal and a 90 degree angle at elbows. Palms should be facing upwards. Push weights upwards decreasing angle at elbows and stop while elbows are still slightly bent. Return slowly to starting position while maintaining control.", imageName: "shoulder-press", vidURL: "lPFwcHl0a2c"),
        ExerciseTut(name: "Deadlift", targetedMuscles: "",description: "Stand with your feet underneath the barbell. Bend over and grab the bar without bending your legs. Keep arms straight and straighten your back while raising your chest. Hold for a moment and return to starting position.", imageName: "deadlift", vidURL: "a5zhnubunoE"),
        ExerciseTut(name: "Leg Curl", targetedMuscles: "Hamstrings",description: "Sit in the leg curl machine with the pad against the bottom of your calves. Bend at the knee, moving your feet toward your buttocks", imageName: "leg-curl", vidURL: "jxctD6fL_FQ"),
        ExerciseTut(name: "Pull Up", targetedMuscles: "Back",description: "Hang from a bar overhead using a wide overhand grip. Pull your body up, bending at the elbows until your chin reaches over the bar. Lower back down to where your arms are fully extended.", imageName: "pull-up", vidURL: "WXMKjV11lAk")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exerciseTuts.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as UICollectionViewCell
        let label = cell.viewWithTag(1) as! UILabel
        label.text = exerciseTuts[indexPath.row].name
        //setTitle(exerciseTuts[indexPath.row].name, for: UIControlState.normal)
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
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        getVidURL(vidURL: exerciseTuts[indexPath.row].vidURL)
        let ExerciseTutViewController = self.storyboard?.instantiateViewController(withIdentifier: "ExerciseTutorial") as! ExerciseTutorialViewController
        _ = ExerciseTutViewController.view
        ExerciseTutViewController.name = exerciseTuts[indexPath.row].name
        ExerciseTutViewController.descriptionLabel.text = exerciseTuts[indexPath.row].description
        ExerciseTutViewController.targetedMusclesLabel.text = exerciseTuts[indexPath.row].targetedMuscles
        ExerciseTutViewController.image.image = UIImage(named: exerciseTuts[indexPath.row].imageName)
        ExerciseTutViewController.title = exerciseTuts[indexPath.row].name
        ExerciseTutViewController.vidURL = exerciseTuts[indexPath.row].vidURL
        navigationController?.pushViewController(ExerciseTutViewController, animated:true)
    }
    
    func getVidURL(vidURL: String){
        mainInstance.realVidURL = vidURL
    }
    

}

