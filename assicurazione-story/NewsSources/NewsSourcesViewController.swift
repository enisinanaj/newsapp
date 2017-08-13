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
}

class NewsSourcesViewController : UITableViewController {
    
    let newsSources = [NewsSourceType.MONDO_ASSICURAZIONI, NewsSourceType.GENERALI]
    
    override func viewDidLoad() {
        // loadNewsSourcesHere
//        newsSources?.append(NewsSourceType.MONDO_ASSICURAZIONI)
//        newsSources?.append(NewsSourceType.GENERALI)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsSources.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsSourceCell : NewsSourceCell = tableView.dequeueReusableCell(withIdentifier: "newsSourceRow", for: indexPath) as! NewsSourceCell
        
        let newsSource: NewsSourceProtocol = NewsSourcesFactory.create(sourceType: newsSources[indexPath.row])
        newsSourceCell.sourceImage.image = newsSource.getNewsSourceImage()
        newsSourceCell.sourceTitle.text = newsSource.getNewsSourceTitle()
        
        let transparency: UIColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0)
        
        newsSourceCell.sourceGradient.gradientLayer.colors = [UIColor.black.cgColor, transparency.cgColor]
        newsSourceCell.sourceGradient.gradientLayer.gradient = GradientPoint.bottomTop.draw()
        
        return newsSourceCell
    }
    
}
