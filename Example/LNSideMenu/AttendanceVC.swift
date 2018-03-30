//
//  AttendanceVC.swift
//  LNSideMenu_Example
//
//  Created by apple on 27/03/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import Parchment

class AttendanceVC: UIViewController {

    @IBOutlet var viewMenu: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        sideMenuManager?.sideMenuController()?.sideMenu?.disabled = true
        
        // Load each of the view controllers you want to embed
        // from the storyboard.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let firstViewController = storyboard.instantiateViewController(withIdentifier: "TodayAttendanceVC")
        firstViewController.title = "Today"
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "MonthlyAttendanceVC")
        secondViewController.title = "Monthly"
        
        // Initialize a FixedPagingViewController and pass
        // in the view controllers.
        let pagingViewController = FixedPagingViewController(viewControllers: [
            firstViewController,
            secondViewController
            ])
        
        pagingViewController.borderOptions = .hidden
        pagingViewController.menuBackgroundColor = UIColor(red: 249.0/255, green: 132.0/255, blue: 69.0/255, alpha: 1.0)
        pagingViewController.indicatorColor = .white
        pagingViewController.textColor = .white
        pagingViewController.selectedTextColor = .white
        pagingViewController.backgroundColor = UIColor(red: 249.0/255, green: 132.0/255, blue: 69.0/255, alpha: 1.0)
        pagingViewController.selectedBackgroundColor = UIColor(red: 249.0/255, green: 132.0/255, blue: 69.0/255, alpha: 1.0)
        
        // Make sure you add the PagingViewController as a child view
        // controller and contrain it to the edges of the view.
        addChildViewController(pagingViewController)
        viewMenu.addSubview(pagingViewController.view)
        viewMenu.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParentViewController: self)

    }
    
    @IBAction func btnBackClicked(_ sender: Any)
    {
        navigationController?.popViewController(animated: true)
    }

   

}
