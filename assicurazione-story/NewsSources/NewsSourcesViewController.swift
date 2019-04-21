//
//  NewsSourcesViewController.swift
//  assicurazione-story
//
//  Created by Eni Sinanaj on 13/08/2017.
//  Copyright © 2017 NewlineCode. All rights reserved.
//

import UIKit
import GoogleMobileAds

class NewsSourceCell: UITableViewCell {
    @IBOutlet weak var sourceImage: UIImageView!
    @IBOutlet weak var sourceTitle: UILabel!
    @IBOutlet weak var sourceGradient: UIView!
    @IBOutlet weak var largeSourceName: UILabel!
    
    var newsSourceInstance: NewsSourceProtocol?
}

class NewsSourcesViewController : UITableViewController {
    let newsSources = [NewsSourceType.PEW_RESEARCH_CENTER, NewsSourceType.HUFF_WORLD_NEWS, NewsSourceType.AD, NewsSourceType.HUFF_POLITICS, NewsSourceType.TIME_WORLD, NewsSourceType.THE_WALL_STREET_JOURNAL, NewsSourceType.AD, NewsSourceType.BBC_NEWS, NewsSourceType.INSURANCE_POST, NewsSourceType.TIME_SCIENCE, NewsSourceType.AD, NewsSourceType.INSURANCE_POST_REGULATION, NewsSourceType.REUTERS_WORLD_NEWS, NewsSourceType.INSURANCE_POST_RISK_MANAGEMENT, NewsSourceType.AD]
    
    var selectedNewsLoaded: Bool = false
    
    override func viewDidLoad() {
        
        selectedNewsLoaded = false
        self.tableView.register(UINib(nibName: "AdTableViewCell", bundle: nil), forCellReuseIdentifier: "advertCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsSources.count;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNewsList" {
            let nextScene =  segue.destination as! NewsTableViewController
            
            // Pass the selected object to the new view controller.
            if self.tableView.indexPathForSelectedRow != nil {
                let cell = self.tableView.cellForRow(at: self.tableView.indexPathForSelectedRow!) as! NewsSourceCell
                cell.newsSourceInstance?.downloadNews {
                    nextScene.rssFeed = cell.newsSourceInstance?.getRssFeed()
                    nextScene.rssItems = cell.newsSourceInstance?.getNewsElements()
                    self.selectedNewsLoaded = true
                    
                    nextScene.reloadTableViewData()
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (newsSources[indexPath.row] == NewsSourceType.AD ) {
            let tableViewCell : AdTableViewCell = tableView.dequeueReusableCell(withIdentifier: "advertCell", for: indexPath) as! AdTableViewCell
            
            let bannerView = GADBannerView(adSize: kGADAdSizeLargeBanner)
            bannerView.adUnitID = "ca-app-pub-6514681921761516/7732684748"
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
            tableViewCell.addBannerViewToView(bannerView)
            
            return tableViewCell
        }
        
        let newsSourceCell : NewsSourceCell = tableView.dequeueReusableCell(withIdentifier: "newsSourceRow", for: indexPath) as! NewsSourceCell
        
        let newsSource: NewsSourceProtocol = NewsSourcesFactory.create(sourceType: newsSources[indexPath.row])!
        newsSourceCell.sourceTitle.text = newsSource.getNewsSourceTitle()
        newsSourceCell.newsSourceInstance = newsSource
        
        // let transparency: UIColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0)
        // let black: UIColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.4)
        
        let tuple = newsSource.getBackgroundColor()
        newsSourceCell.sourceGradient.gradientLayer.colors = [tuple.start, tuple.end]
        newsSourceCell.sourceGradient.gradientLayer.gradient = GradientPoint.bottomRightTopLeft.draw()
        newsSourceCell.largeSourceName.text = newsSource.getNewsSourceTitle()
        
        return newsSourceCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (newsSources[indexPath.row] == NewsSourceType.AD ) {
            return 100
        }

        return 140
    }
    
}
