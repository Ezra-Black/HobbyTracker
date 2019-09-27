//
//  AddFriendViewController.swift
//  HobbyTracker
//
//  Created by Joseph Rogers on 9/27/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import UIKit

    //MARK: step 9:
    //here we create a delegate protocol, so we can tell the table view controller on FriendsTableViewController "Hey! update your table lists with this appended friend we have created within THIS page"

protocol AddFriendDelegate {
    func friendWasCreated(_ friend: Friend)
}

class AddFriendViewController: UIViewController {
    
    //MARK: step 8:
    //create the outlets for the AddFriendViewControllers objects on the view.
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var hometownTextfield: UITextField!
    @IBOutlet weak var hobby1TextField: UITextField!
    @IBOutlet weak var hobby2TextField: UITextField!
    @IBOutlet weak var Hobby3TextField: UITextField!
    
    //MARK: step 10:
    //in order to have a delegate we need to have a delegate property.
    
    var delegate: AddFriendDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: step 9
    //create the actions for the two bar button items inside of the AddFriendVC. This will allow us to let the buttons have functionality.
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: step 11:
    //as soon as a friend was added here, we can go ahead and call the delegates function and pass in the friend created, but first we need to set up the segue on the table view so we can pass this data along and know we are about to send data.
    
    //MARK: step 13:
    //start unwrapping your properties of Friend and making sure they are not nil. go to friend.swift and give a default value to your array of hobbies if you havent
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let name = nameTextField.text, !name.isEmpty,
            let hometown = hometownTextfield.text, !hometown.isEmpty else {return}
        var friend = Friend(name: name, hometown: hometown)
        
        if let hobby1 = hobby1TextField.text, !hobby1.isEmpty {
            friend.numberOfHobbies.append(hobby1)
        }
        if let hobby2 = hobby2TextField.text, !hobby2.isEmpty {
                   friend.numberOfHobbies.append(hobby2)
               }
        if let hobby3 = Hobby3TextField.text, !hobby3.isEmpty {
                   friend.numberOfHobbies.append(hobby3)
               }
        
        delegate?.friendWasCreated(friend)
    }
}
