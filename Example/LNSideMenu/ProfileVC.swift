//
//  ProfileVC.swift
//  LNSideMenu_Example
//
//  Created by apple on 24/03/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController , UITableViewDataSource , UITableViewDelegate
{
    let comments = Comment.allComments()
    let section = ["Personal Details", "School Details", "Parent Details"]
    @IBOutlet var tblVProfile: UITableView!
    
    // MARK - Private
    
    private let tableHeaderViewHeight: CGFloat = 300.0
    private let tableHeaderViewCutaway: CGFloat = 0.0
    
    var HeaderView: DetailHeaderView!
    var HeaderMaskLayer: CAShapeLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let myObject = DemoFiles()
        
        print(myObject.lastName())
        
        sideMenuManager?.sideMenuController()?.sideMenu?.disabled = true
        
        tblVProfile.dataSource = self
        tblVProfile.delegate = self
        
        tblVProfile.estimatedRowHeight = 70
        tblVProfile.rowHeight = UITableViewAutomaticDimension
       
        HeaderView = tblVProfile.tableHeaderView as! DetailHeaderView
        
        HeaderView.image = UIImage(named: "01")
        tblVProfile.tableHeaderView = nil
        tblVProfile.addSubview(HeaderView)
        
        tblVProfile.contentInset = UIEdgeInsetsMake(tableHeaderViewHeight, 0, 0, 0)
        tblVProfile.contentOffset = CGPoint(x: 0, y: -tableHeaderViewHeight + 44)
        
        HeaderMaskLayer = CAShapeLayer()
        HeaderMaskLayer.fillColor = UIColor.black.cgColor
        HeaderView.layer.mask = HeaderMaskLayer
        
        let effectiveHeight = tableHeaderViewHeight - tableHeaderViewCutaway/2
        tblVProfile.contentInset = UIEdgeInsetsMake(effectiveHeight, 0, 0, 0)
        tblVProfile.contentOffset = CGPoint(x: 0, y: -effectiveHeight)
        
       
        
        updateHeaderView()
        
        self.tblVProfile.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.tblVProfile.bounds.size.width, height: 0))
        //self.tblVProfile.contentInset = UIEdgeInsetsMake(-dummyViewHeight, 0, 0, 0)
        
    }
    
    func updateHeaderView()
    {
        let effectiveHeight = tableHeaderViewHeight - tableHeaderViewCutaway/2
        var headerRect = CGRect(x: 0, y: -effectiveHeight, width: tblVProfile.bounds.width, height: tableHeaderViewHeight)
        
        if tblVProfile.contentOffset.y < -effectiveHeight
        {
            headerRect.origin.y = tblVProfile.contentOffset.y
            headerRect.size.height = -tblVProfile.contentOffset.y + tableHeaderViewCutaway/2
        }
        
        HeaderView.frame = headerRect
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: headerRect.width, y: 0))
        path.addLine(to: CGPoint(x: headerRect.width, y: headerRect.height))
        path.addLine(to: CGPoint(x: 0, y: headerRect.height - tableHeaderViewCutaway))
        
        HeaderMaskLayer?.path = path.cgPath
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.section[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        
        if let textlabel = header.textLabel {
            textlabel.font = textlabel.font.withSize(22)
            textlabel.textColor = UIColor.black
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 || section == 1
        {
            return comments.count
        }
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
        let cellParent = tableView.dequeueReusableCell(withIdentifier: "ProfileParentCell", for: indexPath) as! ProfileParentCell
        if indexPath.section == 0 || indexPath.section == 1
        {
            cell.comment = comments[indexPath.row]
            return cell
        }
        else
        {
            cellParent.lbltext.text = "Manojbhai Parmar"
            cellParent.imgV.layer.cornerRadius = cellParent.imgV.frame.size.height / 2
            cellParent.imgV.clipsToBounds = true
        }
        
        return cellParent
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    @IBAction func btnBackClicked(_ sender: Any)
    {
        navigationController?.popViewController(animated: true)
    }

}
