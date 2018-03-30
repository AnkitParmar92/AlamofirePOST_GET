//
//  ViewController.swift
//  LNSideMenuEffect
//
//  Created by Luan Nguyen on 6/22/16.
//  Copyright © 2016 Luan Nguyen. All rights reserved.
//


import LNSideMenu


class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource ,LNSideMenuDelegate{
    
    
    
    @IBOutlet var viewAlpha: UIView!
    
    @IBOutlet var collectionHome: UICollectionView!
    
    let dict: NSMutableDictionary = [:]
    let arrData: NSMutableArray = []
    
    let arrayCollectiondata = ["Profile","Result","Attendance","TimeTable","Notice","Homework","Suggestion"]
    let arrayCollectionImagedata = ["profile.png","result.png","attendance.png","timetable.png","notice.png","knowledge.png","notice.png"]
    
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewAlpha.isHidden = true
    print(dict)
    print(arrData)
    
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController?.isNavigationBarHidden = true;
  }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayCollectiondata.count;
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionCell", for: indexPath) as!HomeCollectionCell
        
        cell.imgVCell.image = UIImage(named: arrayCollectionImagedata[indexPath.row])
        cell.lblCell.text = arrayCollectiondata[indexPath.row]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didselect")
        
        let strSelected = arrayCollectiondata[indexPath.row]
        print(strSelected)
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        if strSelected == "Profile"
        {
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
        else if strSelected == "Attendance"
        {
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "AttendanceVC") as! AttendanceVC
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
        else if strSelected == "TimeTable"
        {
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "TimeTableVC") as! TimeTableVC
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
        else if strSelected == "Suggestion"
        {
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "CreateSuggestion") as! CreateSuggestion
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
        else
        {
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
            self.navigationController?.pushViewController(newViewController, animated: true)
            
        }
        
        
        
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // FIXME: Remove code below if u're using your own menu
    //setupNavforDefaultMenu()
  }

  private func setupNavforDefaultMenu() {
//    barButton.image = UIImage(named: "burger")?.withRenderingMode(.alwaysOriginal)
    // Set navigation bar translucent style
    //self.navigationBarTranslucentStyle()
    // Update side menu
    sideMenuManager?.sideMenuController()?.sideMenu?.isNavbarHiddenOrTransparent = true
    // Re-enable sidemenu
    sideMenuManager?.sideMenuController()?.sideMenu?.disabled = false
  }
  
  @IBAction func toogleSideMenu(_ sender: AnyObject) {
    viewAlpha.isHidden = false
    sideMenuManager?.toggleSideMenuView()
    sideMenuManager?.sideMenuController()?.sideMenu?.delegate=self
  }
  
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
    }
    
    func sideMenuDidClose() {
        print("sideMenuDidClose")
        viewAlpha.isHidden = true
    }
    
    func sideMenuDidOpen() {
        print("sideMenuDidOpen")
    }
    
    func didSelectItemAtIndex(_ index: Int) {
        
    }
  
}
