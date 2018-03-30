//
//  CreateSuggestion.swift
//  LNSideMenu_Example
//
//  Created by apple on 28/03/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class CreateSuggestion: UIViewController, CCDropDownMenuDelegate{

    @IBOutlet var btnCreate: UIButton!
    @IBOutlet var txtFDescription: UITextField!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblType: UILabel!
    @IBOutlet var lblTo: UILabel!
    var dropMenuType: ManaDropDownMenu?
    var dropTo: ManaDropDownMenu?
    
    var arrTypeText: NSMutableArray = ["Ankit","parmar"]
    var arrToText: NSMutableArray = ["Student","Faculty","Employee"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenuManager?.sideMenuController()?.sideMenu?.disabled = true
        
        dropMenuType?.removeFromSuperview()
        
        loadTypeMenu()
        loadToMenu()
        

        // Do any additional setup after loading the view.
    }

    
    // MARK: load drop down Methods
    
    func loadTypeMenu() {
        // drop down state
        dropMenuType = ManaDropDownMenu(frame: lblType.frame, title: "-- Select Type --")
        //[arrStateIDs removeObjectAtIndex:0];
        //[arrComplainType removeObjectAtIndex:0];
        dropMenuType?.delegate = self as CCDropDownMenuDelegate
//        dropMenuType.numberOfRows = arrComplainType.count
//        dropMenuType.textOfRows = arrComplainType
        dropMenuType?.numberOfRows = arrTypeText.count
        dropMenuType?.textOfRows = arrTypeText as! [String]
        //self.menu1.heightOfRows = 50;
        //self.menu1.gutter = 5;
        //self.menu1.resilient = YES;
        view.addSubview(dropMenuType!)
        
    }
    
    func loadToMenu() {
        // drop down city
        dropTo = ManaDropDownMenu(frame: lblTo.frame, title: "-- Select To --")
        //[arrCities removeObjectAtIndex:0];
        //[arrAssignedTo removeObjectAtIndex:0];
        dropTo?.delegate = self as CCDropDownMenuDelegate
        dropTo?.numberOfRows = arrToText.count
        dropTo?.textOfRows = arrToText as! [String]
        //self.menu1.heightOfRows = 50;
        //self.menu1.gutter = 5;
        //self.menu1.resilient = YES;
        view.addSubview(dropTo!)
        
    }
    
    // MARK: drop down delegate Methods
    
    func dropDownMenu(_ dropDownMenu: CCDropDownMenu?, didSelectRowAt index: Int) {
        print("\((dropDownMenu as? ManaDropDownMenu)?.title ?? "")")
    }
    
    // MARK: Button click Methods
    
    @IBAction func btnCreateClicked(_ sender: Any) {
    }
    @IBAction func btnBackClicked(_ sender: Any)
    {
        navigationController?.popViewController(animated: true)
    }
}
