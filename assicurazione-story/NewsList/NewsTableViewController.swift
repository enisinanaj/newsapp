//
//  File.swift
//  assicurazione-story
//
//  Created by Eni Sinanaj on 12/08/2017.
//  Copyright © 2017 NewlineCode. All rights reserved.
//

import Foundation
import UIKit
import AlamofireRSSParser

class NewsTableViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var rssItems: [RSSItem]?
    var rssFeed: RSSFeed?
    
    override func viewDidLoad() {
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 255
        
        loadRSSFromMondoAssicurazione()
    }
    
    func loadRSSFromMondoAssicurazione() {
        RSSParser.getRSSFeedResponse(path: "https://www.postonline.co.uk/feeds/rss/category/europe/italy") { (rssFeed: RSSFeed?, status: NetworkResponseStatus) in
            print(rssFeed ?? "null") // it will be nil if status == .error
            self.rssFeed = rssFeed
            self.rssItems = rssFeed?.items
            
            self.reloadTableViewData()
        }
    }
    
    func reloadTableViewData() {
        for (index, _) in (rssItems?.enumerated())! {
            let indexPath = NSIndexPath(row: index, section: 0)
            self.tableView.reloadRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.bottom)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.rssItems == nil) {
            return 50
        }
        
        return (self.rssItems?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell : NewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "newsRow", for: indexPath) as! NewsTableViewCell
        
        if rssItems == nil {
            return tableViewCell
        }
        
        let rssItem = rssItems![indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY @ HH:mm"
        
        tableViewCell.newsDate?.text = dateFormatter.string(from: (rssItem.pubDate)!)
        tableViewCell.newsSource?.text = rssFeed?.title
        
        tableViewCell.newsTitle?.text = rssItem.title
        tableViewCell.newsTitle.sizeToFit()
        
        tableViewCell.newsExcerpt?.text = rssItem.itemDescription
        
//        if rssItem.mediaThumbnail != nil {
//            if let imageUrl = NSURL(string: rssItem.mediaThumbnail!) {
//                if let data = NSData(contentsOf: imageUrl as URL) {
//                    tableViewCell.newsIcon.image = UIImage(data: data as Data)
//                }
//            }
//        }
        
        tableViewCell.sizeToFit()
        
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 255
    }
    
}
