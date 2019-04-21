//
//  InsurancePostMarket.swift
//  assicurazione-story
//
//  Created by Eni Sinanaj on 11/09/2018.
//  Copyright © 2018 NewlineCode. All rights reserved.
//

import AlamofireRSSParser

class TheWallStreetJournal: CommonNewsSourceProtocol {
    
    override func getNewsElements() -> [RSSItem] {
        return self.rssFeed!.items
    }
    
    override func getNewsSource() -> String {
        return "https://feeds.a.dj.com/rss/RSSWorldNews.xml"
    }
    
    override func getBackgroundImageUrl() -> String {
        return "https://c2.staticflickr.com/8/7003/6812695893_9e217df825_n.jpg"
    }
    
    override func getNewsSourceTitle() -> String {
        return "The Wall Street Journal";
    }
    
    override func getBackgroundColor() -> (start: CGColor, end: CGColor) {
        return (start: UIColor(0x006666).cgColor, end: UIColor(0x4C9393).cgColor)
    }
}
