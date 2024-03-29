//
//  FriendsTableViewController.swift
//  HobbyTracker
//
//  Created by Joseph Rogers on 9/27/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

    //MARK: step 20:
    //set up the table view delegate to be of FriendsTableViewController. Control click from the tableview in main.storyboard and drag to the top left icon at the top of the view controller it is in. choose delegate.
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
    
    
    
    
    //MARK: step 12:
    //build the segue navigation for the AddFriendViewController
    //we want the destination of the segue, and to set our delegate.
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
       
         case "AddFriendModalSegue":
            guard let addFriendVC = segue.destination as? AddFriendViewController else { fatalError() }
            addFriendVC.delegate = self
        
        case "ShowFriendDetailSegue":
            guard let indexPath = tableView.indexPathForSelectedRow,
                let friendDetailVC = segue.destination as? FriendDetailViewController else {fatalError()}
            friendDetailVC.friend = friends[indexPath.row]
            
        default: fatalError("an unknown segue was encountered \(segue.identifier ?? "<NO ID>")")
        }
    }
    
    
    
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

    //MARK: step 21:
    //create the tableViewDelegate Conformance.this will allow us to delete cells on the view.
 
 extension FriendsTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        friends.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
 }

//MARK: step 13
//build the conformance to AddFriendDelegate. this will make this page take the friend, add it to the TableView and take responsibility. reload the data as well
extension FriendsTableViewController: AddFriendDelegate {
    func friendWasCreated(_ friend: Friend) {
        print("The Friend \(friend) was just created!")
        friends.append(friend)
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    
}
