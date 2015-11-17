//
//  ViewController.swift
//  ParallaxEffectWithSwift
//
//  Created by Pratik Lad on 17/11/15.
//  Copyright © 2015 pratik. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    
    var name:[String] = ["Bunty","Kintan","Ankit","Bhavesh","Ankur","Mihir","Bhautik","Moin","Jigar","Divyesh","Darshan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.contentInset = UIEdgeInsetsMake(containerView.bounds.size.height, 0.0, 0.0, 0.0)
        tableView.scrollRectToVisible(CGRectMake(0, 0, 1, 1), animated: false)
        let headerImageYOffset:CGFloat =  88 + containerView.bounds.size.height - view.bounds.size.height
        var headerImageFrame:CGRect = containerView.frame
        
        headerImageFrame.origin.y = headerImageYOffset
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        let lbl = cell.viewWithTag(1) as! UILabel
        lbl.text = name[indexPath.row]
        
        return cell
    }
    
    //
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let scrollOffset: CGFloat = -scrollView.contentOffset.y
        let yPos: CGFloat = scrollOffset - containerView.bounds.size.height
        
        self.containerView.frame = CGRectMake(0, yPos, containerView.frame.size.width, containerView.frame.size.height)
        let alpha: CGFloat = 1.0 - (-yPos / containerView.frame.size.height)
        
        self.imageView.alpha = alpha
        let fontSize: CGFloat = 24 - (-yPos / 20)
        self.labelName.font = UIFont.systemFontOfSize(fontSize)
    }
    
    
}

