//
//  Finanza.swift
//  assicurazione-story
//
//  Created by Eni Sinanaj on 13/08/2017.
//  Copyright © 2017 NewlineCode. All rights reserved.
//

import AlamofireRSSParser

class InsurancePostRiskManagement: CommonNewsSourceProtocol {
    
    override func getNewsElements() -> [RSSItem] {
        return self.rssFeed!.items
    }
    
    override func getNewsSource() -> String {
        return "https://www.postonline.co.uk/feeds/rss/category/risk-management"
    }
    
    override func getBackgroundImageUrl() -> String {
        return "https://c1.staticflickr.com/5/4229/35854436835_1b653c198c_n.jpg"
    }
    
    override func getNewsSourceTitle() -> String {
        return "INSURANCE POST Risk Management";
    }
    
    override func getBackgroundColor() -> (start: CGColor, end: CGColor) {
        return (start: UIColor(0xF04903).cgColor, end: UIColor(0xFD5B03).cgColor)
    }
}

