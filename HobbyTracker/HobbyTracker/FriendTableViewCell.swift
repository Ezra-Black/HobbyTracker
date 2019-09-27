//
//  FriendTableViewCell.swift
//  HobbyTracker
//
//  Created by Joseph Rogers on 9/27/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    //MARK: step 9
    //create the outlets for the cell.
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hobbyCount: UILabel!
    @IBOutlet weak var hometownLabel: UILabel!
    
    //MARK: step 8
    //set up our friend property for the cell. it is optional because a cell could maybe not have a friend within it.
    
    
    //MARK: step 10
    //we want to update our labels whenever our friend gets set.
    var friend: Friend? {
        didSet {
            updateCellView()
        }
    }
    
    //MARK: Step 9
    //setup our function to update our views for the cell
    func updateCellView() {
        guard let friend = friend else {return}
        
        nameLabel.text = friend.name
        hometownLabel.text = friend.hometown
        hobbyCount.text = "\(friend.numberOfHobbies.count) hobbies"
    }
    
    
}
