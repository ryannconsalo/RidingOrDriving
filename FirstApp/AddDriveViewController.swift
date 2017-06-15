//
//  AddDriveViewController.swift
//  FirstApp
//
//  Created by Ryann Consalo on 2017/06/12.
//  Copyright © 2017 Ryann Consalo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class AddDriveViewController: UIViewController {

    var tripsRef : DatabaseReference? = Database.database().reference()
    
    @IBOutlet weak var numSeatsTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var startingPointTextField: UITextField!
    @IBOutlet weak var destinationTextField: UITextField!
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveDriveButton(_ sender: Any) {
        var key = self.tripsRef?.childByAutoId().key
        
        if startingPointTextField.text != nil {
            tripsRef?.child("Trips").child(UserDefaults.standard.string(forKey: "university")!).child(key!).child("Starting Point").setValue(startingPointTextField.text)
        }
        if destinationTextField.text != nil {
            tripsRef?.child("Trips").child(UserDefaults.standard.string(forKey: "university")!).child(key!).child("Destination").setValue(destinationTextField.text)
        }
        if dateTextField.text != nil {
            tripsRef?.child("Trips").child(UserDefaults.standard.string(forKey: "university")!).child(key!).child("Date").setValue(dateTextField.text)
        }
        if numSeatsTextField.text != nil {
            tripsRef?.child("Trips").child(UserDefaults.standard.string(forKey: "university")!).child(key!).child("Num Seats").setValue(numSeatsTextField.text)
        }
        
        tripsRef?.child("Trips").child(UserDefaults.standard.string(forKey: "university")!).child(key!).child("Driver").setValue(UserDefaults.standard.string(forKey : "name"))
        tripsRef?.child("Trips").child(UserDefaults.standard.string(forKey: "university")!).child(key!).child("Driver Number").setValue(UserDefaults.standard.string(forKey: "phoneNumber"))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
