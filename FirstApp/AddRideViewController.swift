//
//  AddRideViewController.swift
//  FirstApp
//
//  Created by Ryann Consalo on 2017/06/12.
//  Copyright © 2017 Ryann Consalo. All rights reserved.
//

import UIKit
import Firebase

class AddRideViewController: UIViewController {
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var destinationTextField: UITextField!
    @IBOutlet weak var startingPointTextField: UITextField!
    
    let ref = Database.database().reference()

    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    
    

    // Pass ride criteria to the next view controller to be able to find matches
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "navToRideTable" {
            let rideTableNavigation = segue.destination as! UINavigationController
            
            let rideTable = rideTableNavigation.topViewController as! RideOptionsTableViewController
            
            rideTable.date = dateTextField.text
            rideTable.start = startingPointTextField.text
            rideTable.destination = destinationTextField.text
            
        }
    


        
    }
    

}
