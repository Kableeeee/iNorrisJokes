//
//  LoginScreen.swift
//  iNorrisJokes
//
//  Created by Денис on 13.03.18.
//  Copyright © 2018 DenMekhtiiev. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginScreen: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            self.presentFeedScreen()
        }
    }
    
    @IBAction func createAccountButton(_ sender: Any) {
        
        if let email = emailField.text, let password = passwordField.text {
            Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                if let firebaseError = error {
                    print(firebaseError.localizedDescription)
                    return
                }
                self.presentFeedScreen()
            })
        }
        
    }
    @IBAction func loginButton(_ sender: Any) {
        if let email = emailField.text, let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if let firebaseError = error {
                    print(firebaseError.localizedDescription)
                    return
                }
                self.presentFeedScreen()
            })
        }
    }
    
    func presentFeedScreen() {
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let feed:Feed = storyboard.instantiateViewController(withIdentifier: "Feed") as! Feed
        self.present(feed, animated: true, completion: nil)
    }
}


