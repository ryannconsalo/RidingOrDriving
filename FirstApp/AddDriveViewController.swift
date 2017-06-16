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
import Realm

class AddDriveViewController: UIViewController {

    var tripsRef : DatabaseReference? = Database.database().reference()
    
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var numSeatsTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var startingPointTextField: UITextField!
    @IBOutlet weak var destinationTextField: UITextField!
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // Add drive to the firebase database
    
    @IBAction func saveDriveButton(_ sender: Any) {
        var key = self.tripsRef?.childByAutoId().key
        
        tripsRef?.child("Trips").child(UserDefaults.standard.string(forKey: "university")!).child(dateTextField.text!).child(startingPointTextField.text!).child(destinationTextField.text!).child(key!).child("Driver").setValue(UserDefaults.standard.string(forKey: "name")!)
        tripsRef?.child("Trips").child(UserDefaults.standard.string(forKey: "university")!).child(dateTextField.text!).child(startingPointTextField.text!).child(destinationTextField.text!).child(key!).child("Driver Number").setValue(UserDefaults.standard.string(forKey: "phoneNumber")!)
        tripsRef?.child("Trips").child(UserDefaults.standard.string(forKey: "university")!).child(dateTextField.text!).child(startingPointTextField.text!).child(destinationTextField.text!).child(key!).child("Num Seats").setValue(Int(numSeatsTextField.text!))
        tripsRef?.child("Trips").child(UserDefaults.standard.string(forKey: "university")!).child(dateTextField.text!).child(startingPointTextField.text!).child(destinationTextField.text!).child(key!).child("Time").setValue(timeTextField.text!)

        
        let b = TripRealm()
        b.driver = UserDefaults.standard.string(forKey: "name")!
        b.destination = destinationTextField.text
        b.startingPoint = startingPointTextField.text
        b.date = dateTextField.text
        b.numSeats = Int(numSeatsTextField.text!)!
        b.phoneNumber = UserDefaults.standard.string(forKey: "phoneNumber")!
        
        
        let realm = RLMRealm.default()
        realm.beginWriteTransaction()
        realm.add(b)
        do {
            try realm.commitWriteTransactionWithoutNotifying([])
        } catch {
            print("Error")
        }
        
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
