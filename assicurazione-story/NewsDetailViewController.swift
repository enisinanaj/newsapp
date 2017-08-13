//
//  NewsDetailViewController.swift
//  assicurazione-story
//
//  Created by Eni Sinanaj on 13/08/2017.
//  Copyright © 2017 NewlineCode. All rights reserved.
//

import UIKit
import AlamofireRSSParser

class NewsDetailViewController: UIViewController {
    
    var rssItem: RSSItem?
    
    @IBOutlet weak var dateTime: UILabel!
    @IBOutlet weak var sourceName: UILabel!
    @IBOutlet weak var newsBody: UILabel!
    @IBOutlet weak var articleTitle: UILabel!

    
    var sourceTitle: String?
    
    override func viewDidLoad() {
        if rssItem != nil {
            loadData()
        }
        
        self.title = rssItem?.title
        self.articleTitle.text = rssItem?.title
    }
    
    
    @IBAction func onOriginalArticleRequest(_ sender: Any) {
        UIApplication.shared.open(URL(string: (rssItem?.link)!)!, options: [:], completionHandler: {
            (success) in
            print("Open url: \(success)")
        })
    }
    
    func loadData() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY @ HH:mm"
        dateTime.text = dateFormatter.string(from: (rssItem!.pubDate)!)
        sourceName.text = sourceTitle
        
        newsBody.text = rssItem!.itemDescription?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        newsBody.sizeToFit()
    }
}
