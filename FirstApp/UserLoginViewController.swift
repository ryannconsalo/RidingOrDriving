//
//  UserLoginViewController.swift
//  FirstApp
//
//  Created by Ryann Consalo on 2017/06/13.
//  Copyright © 2017 Ryann Consalo. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore

class UserLoginViewController: UIViewController, LoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
       /*
        if let accessToken = AccessToken.current {
            //AccessToken.current?.userId
        }
        
        if log
        
        if loginButtonDidCompleteLogin(<#T##loginButton: LoginButton##LoginButton#>, result: <#T##LoginResult#>) {
            let homeView = self.storyboard?.instantiateViewController(withIdentifier: "HomeView")
            self.present(homeView!, animated: true, completion: nil)

        }
        */
        
        let loginButton = LoginButton(readPermissions: [ .publicProfile])
        loginButton.delegate = self
        loginButton.center = view.center
        view.addSubview(loginButton)


        // Do any additional setup after loading the view.
    }

    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        print(result)
        
         //let credential = FacebookAuthProvider.credential(withAccessToken: (AccessToken.current?.authenticationToken)!)
        /*
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                return
            }
            print("Firebase logged in")
            let user = Auth.auth().currentUser
            if let user = user {
                let uid = user.uid
                let email = user.email
                let photoURL = user.photoURL
            }
        }
        */
        
        // Successfully logged in --> what to do now
        let homeView = self.storyboard?.instantiateViewController(withIdentifier: "HomeView")
        self.present(homeView!, animated: true, completion: nil)
        
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        //logged out
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
