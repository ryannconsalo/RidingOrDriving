//
//  ProfileViewController.swift
//  FirstApp
//
//  Created by Ryann Consalo on 2017/06/12.
//  Copyright © 2017 Ryann Consalo. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var universityPicker: UIPickerView!
    
    
    
    @IBAction func logOutButton(_ sender: Any) {
        let logInView = self.storyboard?.instantiateViewController(withIdentifier: "LogIn")
        self.present(logInView!, animated: true, completion: nil)

        
    }
    var pickerData : [String] = ["Berkeley", "Brown", "Bucknell", "Duke", "Fordham", "Penn State", "University Michigan", "UPenn", "University Pittsburg", "USC", "UVA", "Villanova"]
    
    let defaults: UserDefaults = UserDefaults.standard
    
    var university : String?
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.universityPicker.delegate = self
        self.universityPicker.dataSource = self
        // Do any additional setup after loading the view.
        
        //pickerData = ["UVA", "Penn State", "Fordham"]

    }
    
    override func viewDidAppear(_ animated: Bool) {
        var na : String? = UserDefaults.standard.string(forKey: "name")
        var num: String? = UserDefaults.standard.string(forKey: "phoneNumber")
        var r : Int? = UserDefaults.standard.integer(forKey: "row")
        if na != nil {
            nameTextField.text = na
        }
        if num != nil {
            phoneNumberTextField.text = num
        }
        if r != nil {
            self.universityPicker.selectRow(r!, inComponent: 0, animated: false)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        defaults.set(nameTextField.text, forKey: "name")
        defaults.set(phoneNumberTextField.text, forKey: "phoneNumber")
        //defaults.set(university, forKey: "university")
        //defaults.set(pickRow, forKey: "row")
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        defaults.set(pickerData[row], forKey: "university")
        defaults.set(row, forKey: "row")
    }
    
    /*
     func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myLabel.text = pickerData[row]
    }
     */
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
