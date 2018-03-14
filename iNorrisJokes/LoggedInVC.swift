//
//  LoggedInVC.swift
//  iNorrisJokes
//
//  Created by Денис on 14.03.18.
//  Copyright © 2018 DenMekhtiiev. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoggedInVC: UIViewController {

    @IBAction func logoutButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            dismiss(animated: true, completion: nil)
        } catch {
            print("Певні проблеми з виходом")
        }
        
    }
    
}
