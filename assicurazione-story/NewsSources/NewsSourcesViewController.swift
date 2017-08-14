//
//  NewsSourcesViewController.swift
//  assicurazione-story
//
//  Created by Eni Sinanaj on 13/08/2017.
//  Copyright © 2017 NewlineCode. All rights reserved.
//

import UIKit

class NewsSourceCell: UITableViewCell {
    @IBOutlet weak var sourceImage: UIImageView!
    @IBOutlet weak var sourceTitle: UILabel!
    @IBOutlet weak var sourceGradient: UIView!
    @IBOutlet weak var largeSourceName: UILabel!
    
    var newsSourceInstance: NewsSourceProtocol?
}

var ColorsArray = [
    (start: UIColor(0xCF000F).cgColor, end: UIColor(0xE3000E).cgColor),
    (start: UIColor(0x7E3661).cgColor, end: UIColor(0x953163).cgColor),
    (start: UIColor(0xF04903).cgColor, end: UIColor(0xFD5B03).cgColor),
    (start: UIColor(0x00587A).cgColor, end: UIColor(0x008891).cgColor),
    (start: UIColor(0xBF4A67).cgColor, end: UIColor(0xE6567A).cgColor)]

class NewsSourcesViewController : UITableViewController {
    let newsSources = [NewsSourceType.MONDO_ASSICURAZIONI, NewsSourceType.GENERALI, NewsSourceType.IVASS, NewsSourceType.INSURANCE_POST, NewsSourceType.FINANZA_COM]
    
    var selectedNewsLoaded: Bool = false
    
    override func viewDidLoad() {
        selectedNewsLoaded = false
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
        let newsSourceCell : NewsSourceCell = tableView.dequeueReusableCell(withIdentifier: "newsSourceRow", for: indexPath) as! NewsSourceCell
        
        let newsSource: NewsSourceProtocol = NewsSourcesFactory.create(sourceType: newsSources[indexPath.row])
        newsSourceCell.sourceTitle.text = newsSource.getNewsSourceTitle()
        newsSourceCell.newsSourceInstance = newsSource
        
        // let transparency: UIColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0)
        // let black: UIColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.4)
        
        let tuple = ColorsArray[indexPath.row]
        newsSourceCell.sourceGradient.gradientLayer.colors = [tuple.start, tuple.end]
        newsSourceCell.sourceGradient.gradientLayer.gradient = GradientPoint.bottomRightTopLeft.draw()
        newsSourceCell.largeSourceName.text = newsSource.getNewsSourceTitle()
        
        return newsSourceCell
    }
    
}
