//
//  ReutersWorldNews.swift
//  assicurazione-story
//
//  Created by Eni Sinanaj on 21/04/2019.
//  Copyright © 2019 NewlineCode. All rights reserved.
//

import AlamofireRSSParser

class ReutersWorldNews: CommonNewsSourceProtocol {
    
    override func getNewsElements() -> [RSSItem] {
        return self.rssFeed!.items
    }
    
    override func getNewsSource() -> String {
        return "http://feeds.reuters.com/Reuters/worldNews"
    }
    
    override func getBackgroundImageUrl() -> String {
        return "https://c2.staticflickr.com/8/7003/6812695893_9e217df825_n.jpg"
    }
    
    override func getNewsSourceTitle() -> String {
        return "Reuters World News";
    }
    
    override func getBackgroundColor() -> (start: CGColor, end: CGColor) {
        return (start: UIColor(0xF97253).cgColor, end: UIColor(0xFF886C).cgColor)
    }
}
