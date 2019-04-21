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
import GoogleMobileAds

class NewsTableViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var rssItems: [RSSItem]?
    var rssFeed: RSSFeed?
    
    override func viewDidLoad() {
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 255
    }
    
    func reloadTableViewData() {
        self.tableView.beginUpdates()
        
        for (index, _) in (rssItems?.enumerated())! {
            let indexPath = NSIndexPath(row: index, section: 0)
            
            self.tableView.insertRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.bottom)
        }
        
        self.tableView.endUpdates()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailView" {
            let nextScene = segue.destination as! NewsDetailViewController
            
            if let usender:Any = sender {
                if let button = usender as? NewsReadMoreButton {
                    nextScene.rssItem = button.rssItem
                    nextScene.sourceTitle = rssFeed?.title
                }
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.rssItems == nil) {
            return 0
        }
        
        return (self.rssItems?.count)!
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell : NewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "newsRow", for: indexPath) as! NewsTableViewCell
        
        if rssItems == nil || indexPath.row > (rssItems?.count)! {
            return tableViewCell
        }
        
        let rssItem = rssItems![indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY @ HH:mm"
        tableViewCell.newsDate?.text = dateFormatter.string(from: (rssItem.pubDate)!)
        
        tableViewCell.newsSource?.text = rssFeed?.title
        tableViewCell.newsTitle?.text = rssItem.title
        tableViewCell.newsTitle.sizeToFit()
        tableViewCell.newsReadMore.rssItem = rssItem
        
        tableViewCell.newsExcerpt?.text = rssItem.itemDescription?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        
        tableViewCell.sizeToFit()
        tableViewCell.updateConstraints()
        
        return tableViewCell
    }
    
}
