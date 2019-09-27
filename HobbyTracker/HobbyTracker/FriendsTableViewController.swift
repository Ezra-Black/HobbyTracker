//
//  FriendsTableViewController.swift
//  HobbyTracker
//
//  Created by Joseph Rogers on 9/27/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import UIKit

class FriendsTableViewController: UIViewController {
    
    //MARK: step 4:
    //create a IBOutlet so the view controller also knows about the tableView
    //click from the outlet icon on the line number indicator, and link it to the table view on the screen that corresponds to with the name of this file.
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: step5:
    //create a property to store our data that we want to show on the table view
    
    var friends: [Friend] = []
                           //^ This initilizes the property at runtime as EMPTY.
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: step 6:
        //use the viewDidLoad to fill the array with information.
        friends.append(Friend(name: "Joe", hometown: "Elsah", numberOfHobbies: ["Coding", "Guitar", "Stocks"]))
        friends.append(Friend(name: "Cheyenne", hometown: "Holiday Shores", numberOfHobbies: ["cats", "Cuteness", "Being a witch"]))
        friends.append(Friend(name: "Bob", hometown: "New York", numberOfHobbies: ["Golf", "Pokemon Go"]))
        friends.append(Friend(name: "Danny", hometown: "Little town", numberOfHobbies: ["None"]))
        friends.append(Friend(name: "John", hometown: "UK", numberOfHobbies: ["Donuts", "Pokemon Go"]))
        friends.append(Friend(name: "Lisa", hometown: "Seattle", numberOfHobbies: ["Art", "Music"]))
        friends.append(Friend(name: "Anthony", hometown: "Manhattan", numberOfHobbies: ["Trying to stay alive", "Break Dancing"]))
        friends.append(Friend(name: "Paul", hometown: "Area 51", numberOfHobbies: ["Probing"]))
    }
    
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
    //MARK: step 2:
   //Building our extension which lets us do things with our tableviewCell
extension FriendsTableViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    //MARK: step3:
    //deque the cell so you can fill it with information
    
    
    //MARK: step 7:
    //set up the cell with cellForRowAt. First the indexPath.row (where the user tapped) has to be assigned to a variable we can use. We have access to this index path within the functions parameters.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //this cell was set up to be the one we made in the custom views
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendTableViewCell else {
            fatalError()
        }
        //we assign our friend property that the use chose to the cell. 
        let friend = friends[indexPath.row]
        cell.friend = friend
        return cell
    }
    
    
}
