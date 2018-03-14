//
//  Feed.swift
//  iNorrisJokes
//
//  Created by Денис on 14.03.18.
//  Copyright © 2018 DenMekhtiiev. All rights reserved.
//

import UIKit
import FirebaseAuth

class Feed: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
