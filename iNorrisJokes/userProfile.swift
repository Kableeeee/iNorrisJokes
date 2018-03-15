//
//  UserProfile.swift
//  iNorrisJokes
//
//  Created by Денис on 14.03.18.
//  Copyright © 2018 DenMekhtiiev. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase



class UserProfile: UIViewController {
    
    @IBOutlet weak var addJokePlace: UITextField!
    
    @IBAction func backToFeedButton(_ sender: Any) {
        self.presentFeedScreen()
    }
    
    @IBAction func addJoke(_ sender: Any) {
        if self.addJokePlace.isHidden != false{
            self.addJokePlace.isHidden = false
        } else {
            // here addJoke
            if self.addJokePlace.text != ""{
                var ref: DatabaseReference!
                ref = Database.database().reference()
                let author = (Auth.auth().currentUser?.email)?.split(separator: "@")[0]
                ref.child("jokes").childByAutoId().setValue(["author": author, "jokeText": self.addJokePlace.text, "voted": 0])
            }
            self.addJokePlace.isHidden = true
        }
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        self.presentLoginScreen()
        do {
            try Auth.auth().signOut()
        } catch {
            print("Помилка виходу")
        }
        
    }
    
    func presentLoginScreen() {
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loginScreen:LoginScreen = storyboard.instantiateViewController(withIdentifier: "LoginScreen") as! LoginScreen
        self.present(loginScreen, animated: true, completion: nil)
    }
    
    func presentFeedScreen() {
        print("here")
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let feed:Feed = storyboard.instantiateViewController(withIdentifier: "Feed") as! Feed
        self.present(feed, animated: true, completion: nil)
    }
}
