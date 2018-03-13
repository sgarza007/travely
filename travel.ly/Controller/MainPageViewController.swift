//
//  MainPageViewController.swift
//  travel.ly
//
//  Created by Saul Garza on 3/12/18.
//  Copyright © 2018 University of San Diego. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //what's below are the pickers
    @IBOutlet weak var originPicker: UIPickerView!
    @IBOutlet weak var destinationPicker: UIPickerView!
    @IBOutlet weak var departurePicker: UIDatePicker!
    @IBOutlet weak var returnPicker: UIDatePicker!
    
    //picker view related dtat and functions
    // Tag 1 is Origin Picker
    // Tag 2 is Destination Picker
    let placesOrigin = ["-", "San Diego", "New York", "Rome"]
    let placesDestination = ["-", "San Diego", "New York", "Rome"]
    var originPlacePicked = ""
    var destinationPlacePicked = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //TODO: Set this to be delegate of pickers
        originPicker.delegate = self
        originPicker.dataSource = self
        destinationPicker.delegate = self
        destinationPicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //TODO: Add protocols as needed
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1{
            return placesOrigin.count
        }
        else if pickerView.tag == 2{
            return placesDestination.count
        }
        else{
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1{
            return placesOrigin[row]
        }
        else if pickerView.tag == 2{
            return placesDestination[row]
        }
        else{
            return("Error in picker")
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1{
            originPlacePicked = placesOrigin[row]
            print("Selected : \(originPlacePicked)")
        }
        else if pickerView.tag == 2{
            destinationPlacePicked = placesDestination[row]
            print("Selected : \(destinationPlacePicked)")
        }
        else{
            print("Error in picker")
        }
    }
    
    //TODO: Implement button that calculates the cost
    @IBAction func calculateBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToActivitiesVC", sender: self)
    }
    
    //TODO: Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToActiviesVC" {
            print("In Activities VC")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
