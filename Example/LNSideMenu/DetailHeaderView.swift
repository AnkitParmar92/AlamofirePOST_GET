//
//  DetailHeaderView.swift
//  LNSideMenu_Example
//
//  Created by apple on 24/03/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class DetailHeaderView: UIView
{
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage?
    {
        didSet{
            if let image = image {
                
                imageView.image = image
            }
            else
            {
                imageView.image = nil
            }
        }
    }
}
