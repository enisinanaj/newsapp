//
//  InsurancePostMarket.swift
//  assicurazione-story
//
//  Created by Eni Sinanaj on 11/09/2018.
//  Copyright © 2018 NewlineCode. All rights reserved.
//

import AlamofireRSSParser

class BBCNews: CommonNewsSourceProtocol {
    
    override func getNewsElements() -> [RSSItem] {
        return self.rssFeed!.items
    }
    
    override func getNewsSource() -> String {
        return "https://feeds.bbci.co.uk/news/world/rss.xml#"
    }
    
    override func getBackgroundImageUrl() -> String {
        return "https://c2.staticflickr.com/8/7003/6812695893_9e217df825_n.jpg"
    }
    
    override func getNewsSourceTitle() -> String {
        return "BBC News - World";
    }
    
    override func getBackgroundColor() -> (start: CGColor, end: CGColor) {
        return (start: UIColor(0xDD2E44).cgColor, end: UIColor(0xEA564B).cgColor)
    }
}
