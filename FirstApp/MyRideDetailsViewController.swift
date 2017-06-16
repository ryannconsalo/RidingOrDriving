//
//  MyRideDetailsViewController.swift
//  FirstApp
//
//  Created by Ryann Consalo on 2017/06/12.
//  Copyright © 2017 Ryann Consalo. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class MyRideDetailsViewController: UIViewController {
    
    var trip : TripRealm?
    var driver : String?
    var time : String?
    var date : String?
    var destination : String?
    var startingPoint : String?

    @IBOutlet weak var driverLabel: UILabel!
    @IBOutlet weak var seatsLeftLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var startingPointLabel: UILabel!
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        driverLabel.text = driver
        seatsLeftLabel.text = "\(trip?.numSeats)"
        dateLabel.text = date
        destinationLabel.text = destination
        startingPointLabel.text = startingPoint

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
