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
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    var pickerData : [String] = ["UVA", "Penn State", "Fordham"]
    
    let defaults: UserDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.universityPicker.delegate = self
        self.universityPicker.dataSource = self
        // Do any additional setup after loading the view.
        
        //pickerData = ["UVA", "Penn State", "Fordham"]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        defaults.set(nameTextField, forKey: "name")
        defaults.set(phoneNumberTextField, forKey: "phoneNumber")
        defaults.set(universityPicker, forKey: "university")
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
