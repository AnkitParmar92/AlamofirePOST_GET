//
//  TimeTableVC.swift
//  LNSideMenu_Example
//
//  Created by apple on 27/03/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import Parchment


class CustomPagingView: PagingView  {
    
    override func setupConstraints() {
        // Use our convenience extension to constrain the page view to all
        // of the edges of the super view.
        constrainToEdges(pageView)
    }
}

// Create a custom paging view controller and override the view with
// our own custom subclass.
class CustomPagingViewController: FixedPagingViewController {
    override func loadView() {
        view = CustomPagingView(
            options: options,
            collectionView: collectionView,
            pageView: pageViewController.view)
    }
}

class TimeTableVC: UIViewController {
    
    @IBOutlet var ViewTable: UIView!
    
     var cities = [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday"
    ]
    
    let pagingViewController = CustomPagingViewController(viewControllers: [
        IndexViewController(index: 0,titleString: "Monday"),
        IndexViewController(index: 1,titleString: "Tuesday"),
        IndexViewController(index: 2,titleString: "Wednesday"),
        IndexViewController(index: 3,titleString: "Thursday"),
        IndexViewController(index: 4,titleString: "Friday"),
        IndexViewController(index: 5,titleString: "Saturday")
        ])
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        sideMenuManager?.sideMenuController()?.sideMenu?.disabled = true
        
        pagingViewController.borderOptions = .hidden
        pagingViewController.menuBackgroundColor = UIColor(red: 249.0/255, green: 132.0/255, blue: 69.0/255, alpha: 1.0)
        pagingViewController.indicatorColor = .white
        pagingViewController.textColor = .white
        pagingViewController.selectedTextColor = .white
        pagingViewController.backgroundColor = UIColor(red: 249.0/255, green: 132.0/255, blue: 69.0/255, alpha: 1.0)
        pagingViewController.selectedBackgroundColor = UIColor(red: 249.0/255, green: 132.0/255, blue: 69.0/255, alpha: 1.0)
        pagingViewController.select(index: 2)
        
        // Make sure you add the PagingViewController as a child view
        // controller and contrain it to the edges of the view.
        addChildViewController(pagingViewController)
        ViewTable.addSubview(pagingViewController.view)
        ViewTable.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParentViewController: self)
        
        // Set the menu view as the title view on the navigation bar. This
        // will remove the menu view from the view hierachy and put it
        // into the navigation bar.
        
        navigationItem.titleView = pagingViewController.collectionView
//        navigationItem.titleView?.frame = CGRect(x: 0, y: 55, width: (navigationItem.titleView?.frame.size.width)!, height: (navigationItem.titleView?.frame.size.height)!)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let navigationBar = navigationController?.navigationBar else { return }
        navigationItem.titleView?.frame = CGRect(origin: .zero, size: navigationBar.bounds.size)
        pagingViewController.menuItemSize = .fixed(width: 100, height: navigationBar.bounds.height)
    }
    
    @IBAction func btnBackClicked(_ sender: Any)
    {
        navigationController?.popViewController(animated: true)
    }

}




