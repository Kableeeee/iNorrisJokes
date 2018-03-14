//
//  Feed.swift
//  iNorrisJokes
//
//  Created by Денис on 14.03.18.
//  Copyright © 2018 DenMekhtiiev. All rights reserved.
//

import UIKit
import FirebaseDatabase

class Feed: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        var ref: DatabaseReference!
//        
//        
//        ref = Database.database().reference()
//        
//        let author = "Jack"
//        let jokeText = "dfsaddsdsaokdasod ;asd;lk"
//        let voted = 0
//        ref.child("jokes").childByAutoId().setValue(["author": author, "jokeText": jokeText, "voted": voted])
        
    }
    
    @IBAction func profileButton(_ sender: Any) {
        self.presentProfileScreen()
    }
    
    func presentProfileScreen() {
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let userProfile:UserProfile = storyboard.instantiateViewController(withIdentifier: "UserProfile") as! UserProfile
        self.present(userProfile, animated: true, completion: nil)
    }

}
