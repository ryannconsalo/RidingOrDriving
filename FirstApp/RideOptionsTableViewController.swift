//
//  RideOptionsTableViewController.swift
//  FirstApp
//
//  Created by Ryann Consalo on 2017/06/12.
//  Copyright © 2017 Ryann Consalo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class RideOptionsTableViewController: UITableViewController {
    
    
    var university = UserDefaults.standard.string(forKey: "university")
    var options : [Trip] = []
    var reference : DatabaseReference = Database.database().reference().child("Trips")
    var start : String?
    var destination : String?
    var date : String?
    var keys: [String] = []
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var refData = reference.child(university!).child(date!).child(start!).child(destination!)
        var dat = refData.observe(.value, with: { (snapshot) in
            if !snapshot.exists() {
                let alertController = UIAlertController(title: "No Rides Found", message: " ", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
            
            else {
                let dict1 = snapshot.value as! NSDictionary
            
                let tripDetails = Trip()
                
                for (key, value) in dict1 {
                    self.keys.append(key as! String)
                    let trip = value as? NSDictionary
                
                    let driver = trip?["Driver"] as! String
                    tripDetails?.driver = driver
                    
                    let num = trip?["Driver Number"] as! String
                    print(num)
                    tripDetails?.phoneNumber = num
                
                    let numSeats = trip?["Num Seats"] as! Int
                    tripDetails?.numSeats = numSeats
                
                    let time = trip?["Time"] as! String
                    tripDetails?.time = time
                    
                    tripDetails?.startingPoint = self.start
                    tripDetails?.destination = self.destination
                    tripDetails?.date = self.date

                    self.options.append(tripDetails!)
                
                    print(tripDetails!.driver)
                    print(tripDetails!.phoneNumber)
                    print(tripDetails!.numSeats)
                    print(self.options)
                    print(self.keys)
                    print(self.options.count)
                    self.tableView.reloadData()
                }
            }
            
        })
    
        
        //var refe = Database.database().reference().child("Games").observe(.value) { (snapshot) in
           // print (snapshot)
        //}
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //ref?.child("Trips").observe(.childAdded, with: { (snapshot) in
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return options.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tripOption", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = "Driver: \(options[indexPath.row].driver!)"
        cell.detailTextLabel?.text = "Number of Open Seats: \(options[indexPath.row].numSeats!)"
        
        return cell
    }
    
    
    
    
    
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "navToRideOptionDetails" {
            
            let rideDetails = segue.destination as! UINavigationController
            let rideDetails2 = rideDetails.topViewController as! RideOptionDetailViewController
            
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)
            
            rideDetails2.trip = options[(indexPath?.row)!]
            rideDetails2.key = keys[(indexPath?.row)!]
        }
        
    }
    

}
