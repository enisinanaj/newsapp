//
//  NewsDetailViewController.swift
//  assicurazione-story
//
//  Created by Eni Sinanaj on 13/08/2017.
//  Copyright © 2017 NewlineCode. All rights reserved.
//

import UIKit
import AlamofireRSSParser
import GoogleMobileAds

class NewsDetailViewController: UIViewController {
    
    var rssItem: RSSItem?
    
    @IBOutlet weak var dateTime: UILabel!
    @IBOutlet weak var sourceName: UILabel!
    @IBOutlet weak var newsBody: UILabel!
    @IBOutlet weak var articleTitle: UILabel!
    
    var bannerView: GADBannerView!

    
    var sourceTitle: String?
    
    override func viewDidLoad() {
        if rssItem != nil {
            loadData()
        }
        
        self.title = rssItem?.title
        self.articleTitle.text = rssItem?.title
        
        bannerView = GADBannerView(adSize: kGADAdSizeLargeBanner)
        bannerView.rootViewController = self
        bannerView.adUnitID = "ca-app-pub-6514681921761516/1080959563"
        bannerView.load(GADRequest())
        
        addBannerViewToView(bannerView)
    }
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(bannerView)
        self.view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: self.bottomLayoutGuide,
                                attribute: .top,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: self.view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
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
