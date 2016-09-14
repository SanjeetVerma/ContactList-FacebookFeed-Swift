//
//  CustomCell.swift
//  FacebookFeed
//
//  Created by sanjeet on 9/9/16.
//  Copyright © 2016 sanjeet. All rights reserved.
//
import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var UserImg: UIImageView!
    @IBOutlet weak var Checkbox: UIButton!
    @IBOutlet weak var UserName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.UserImg.layer.cornerRadius = self.UserImg.bounds.size.width * 0.5
        self.UserImg.clipsToBounds = true
        
        self.Checkbox.layer.cornerRadius = self.Checkbox.bounds.size.width * 0.5
        self.Checkbox.clipsToBounds = true
    }
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    

}
