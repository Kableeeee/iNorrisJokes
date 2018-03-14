//
//  LoggedInVC.swift
//  iNorrisJokes
//
//  Created by Денис on 14.03.18.
//  Copyright © 2018 DenMekhtiiev. All rights reserved.
//
import UIKit
import FirebaseAuth

class UserProfile: UIViewController {
    
    @IBAction func logoutButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            dismiss(animated: true, completion: nil)
        } catch {
            print("Помилка виходу")
        }
        
    }
    
//    func presentLoginScreen() {
//        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let loginScreen:LoginScreen = storyboard.instantiateViewController(withIdentifier: "LoginScreen") as! LoginScreen
//        self.present(loginScreen, animated: true, completion: nil)
//    }
}
