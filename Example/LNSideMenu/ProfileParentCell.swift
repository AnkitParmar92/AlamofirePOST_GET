//
//  ProfileParentCell.swift
//  LNSideMenu_Example
//
//  Created by apple on 26/03/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class ProfileParentCell: UITableViewCell {

    @IBOutlet weak var imgV: UIImageView!
    @IBOutlet weak var lbltext: UILabel!
    
    var comment: Comment?
    {
        didSet{
            if let comment = comment{
                lbltext.text = comment.user.toString()
                lbltext.textColor = comment.user.toColor()
            }
            else
            {
                lbltext.text = nil
            }
        }
    }

}
