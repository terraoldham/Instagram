//
//  PhotosViewController.swift
//  Instagram
//
//  Created by Terra Oldham on 11/13/14.
//  Copyright (c) 2014 HearsaySocial. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    var photos: NSArray! = []
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        var clientId = "69072c46cdd44de6a60c3913e586dfd6"
        
        var url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=\(clientId)")
        var request = NSURLRequest(URL: url!)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var responseDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
            self.photos = responseDictionary["data"] as NSArray
            self.tableView.reloadData()
            
            println("response: \(self.photos)")
        }
    }

}
