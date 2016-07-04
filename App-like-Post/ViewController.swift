//
//  ViewController.swift
//  App-like-Post
//
//  Created by Khaled Rahman Ayon on 28/06/16.
//  Copyright © 2016 iosApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        DataService.instance.loadPost()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onPostLoaded:", name: "postLoaded", object: nil)
        
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = DataService.instance.loadedPosts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
            
            cell.confugureCell(post)
            return cell
        }else {
            
            let cell = PostCell()
            cell.confugureCell(post)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 87.0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPosts.count
    }
    
    func onPostLoaded(notify: AnyObject){
        tableView.reloadData()
        
    }

}

