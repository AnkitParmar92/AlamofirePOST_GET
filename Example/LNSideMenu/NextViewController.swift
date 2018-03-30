//
//  NextViewController.swift
//  LNSideMenuEffect
//
//  Created by Luan Nguyen on 6/30/16.
//  Copyright © 2016 Luan Nguyen. All rights reserved.
//

import UIKit
import Alamofire

class NextViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var people = [Person]()
    
    let arrayData:[String] = ["This is ans important and very special characteristic of physics and this is so usefull for students and faculties",
                              "This is ans important and very special characteristic of physics.",
                              "this is so usefull for students and faculties This is ans important and very special characteristic of physics and This is ans important and very special characteristic of physics and This is ans important and very special characteristic of physics and",
                              "This is ans important and very special characteristic of physics and this is so usefull for students and faculties",
                              "This is ans important and very special characteristic of physics.",
                              "this is so usefull for students and faculties This is ans important and very special characteristic of physics and This is ans important and very special characteristic of physics and This is ans important and very special characteristic of physics and",
                              "This is ans important and very special characteristic of physics and this is so usefull for students and faculties",
                              "This is ans important and very special characteristic of physics.",
                              "this is so usefull for students and faculties This is ans important and very special characteristic of physics and This is ans important and very special characteristic of physics and This is ans important and very special characteristic of physics and",
                              "this is last and very special."]
    
    @IBOutlet var tblV: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Alamofire POST API with json/application formate parameters
//    let parameters: [String: Any] = [
//        "InstituteKey" : "GokulCollege",
//        "Schoolid" : "5"
//        ]
//
//
//    Alamofire.request("http://webapi.hydrae.in/Api/GenerateSuggestionDetails", method: .post, parameters: parameters, encoding: JSONEncoding.default)
//        .responseJSON { response in
//            print(response)
//    }
    
    //Call Alamofire by another class
    
    SVProgressHUD.show()
    
    NetworkingService.Shared.getPeople { response in
        
        //print(response)
        
        self.people = response.people
        self.tblV.reloadData()
        
        self.tblV.dataSource = self;
        self.tblV.delegate = self
        
        SVProgressHUD.dismiss()

    }
    
    
    
    self.tblV.estimatedRowHeight = self.tblV.rowHeight;
    self.tblV.rowHeight = UITableViewAutomaticDimension;
    
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    // FIXME: Remove code below if u're using your own menu
    setupNavForDefaultMenu()
    
    // Add left bar button item
    let leftBarItem = UIBarButtonItem(image: UIImage(named: "burger"), style: .plain, target: self, action: #selector(toggleSideMenu))
    navigationItem.leftBarButtonItem = leftBarItem
    
    title = "Next ViewController"
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  private func setupNavForDefaultMenu() {
    // Revert navigation bar translucent style to default
    navigationBarNonTranslecentStyle()
    // Update side menu after reverted navigation bar style
    sideMenuManager?.sideMenuController()?.sideMenu?.isNavbarHiddenOrTransparent = false
    navigationItem.hidesBackButton = true
  }
  
  @objc func toggleSideMenu() {
    sideMenuManager?.toggleSideMenuView()
  }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath)
        
        print(people)
        (cell.contentView.viewWithTag(1) as! UILabel).text = self.arrayData[indexPath.row]
        //(cell.contentView.viewWithTag(2) as! UILabel).text = "Number \(indexPath.row)"
        (cell.contentView.viewWithTag(2) as! UILabel).text = people[indexPath.row].name
        (cell.contentView.viewWithTag(3) as! UILabel).text = self.arrayData[indexPath.row]
        
        return cell
    }
  
    @IBAction func btnBackClicked(_ sender: Any)
    {
        navigationController?.popViewController(animated: true)
    }
   
  
}
