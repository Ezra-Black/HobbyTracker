//
//  FriendDetailViewController.swift
//  HobbyTracker
//
//  Created by Joseph Rogers on 9/27/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {
    
    //MARK: step 16:
    //create outlets for the objects on the DetailVC
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hometownLabel: UILabel!
    @IBOutlet weak var hobbyListTextview: UITextView!
    
    
    //MARK: step 17:
    //we need to create a property for this view to display information for the friend
    var friend: Friend? {
        didSet {
            updateViews()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: step 19:
        //add the updateViews method to the ViewDidLoad
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    //MARK: step 18:
    //create a private function for this page that updates the views.
    private func updateViews() {
        guard let friend = friend, isViewLoaded else {return}
        
        nameLabel.text = friend.name
        hometownLabel.text = friend.hometown
         
        var hobbyText = ""
        
        for hobby in friend.numberOfHobbies {
            hobbyText += "• \(hobby)\n"
        }
        hobbyListTextview.text = hobbyText
    }
    
 

}
