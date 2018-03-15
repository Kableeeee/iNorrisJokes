//
//  Feed.swift
//  iNorrisJokes
//
//  Created by Денис on 14.03.18.
//  Copyright © 2018 DenMekhtiiev. All rights reserved.
//

import UIKit
import FirebaseDatabase

class Feed: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    var jokesList = [String]()
    
    
    @IBOutlet weak var feedView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedView.delegate = self
        feedView.dataSource = self
        feedView.tableFooterView = UIView()
        
        ref = Database.database().reference()
        
        // Retrieve the jokes and listnen for changes
        databaseHandle = ref?.child("jokes").observe(.childAdded, with: { (snapshot) in
            
            // Code to execute when a child is added under "jokes"
            //Take the value from the snapshot and added it to jokesList array
            let joke = snapshot.childSnapshot(forPath: "jokeText")
            let jokes = String(describing: joke).split(separator: " ", maxSplits: 2, omittingEmptySubsequences: true)[2]
            self.jokesList.append(String(jokes))
            
            self.feedView.reloadData()

        })
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = feedView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let row = indexPath.row
        cell.textLabel?.numberOfLines = 0;
        cell.textLabel?.text = jokesList[row]
        cell.textLabel?.font = UIFont.init(name: "Avenir Next", size: 20.0)
        cell.textLabel?.textAlignment = NSTextAlignment.center
        
        return cell
    }
    
    // Profile button
    @IBAction func profileButton(_ sender: Any) {
        self.presentProfileScreen()
    }
    func presentProfileScreen() {
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let userProfile:UserProfile = storyboard.instantiateViewController(withIdentifier: "UserProfile") as! UserProfile
        self.present(userProfile, animated: true, completion: nil)
    }

}
