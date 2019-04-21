//
//  InsurancePost.swift
//  assicurazione-story
//
//  Created by Eni Sinanaj on 13/08/2017.
//  Copyright © 2017 NewlineCode. All rights reserved.
//

import AlamofireRSSParser

class AnsaItTopNews: CommonNewsSourceProtocol {
    
    override func getNewsElements() -> [RSSItem] {
        return self.rssFeed!.items
    }
    
    override func getNewsSource() -> String {
        return "https://www.postonline.co.uk/feeds/rss/category/technology"
    }
    
    override func getBackgroundImageUrl() -> String {
        return "https://c2.staticflickr.com/8/7003/6812695893_9e217df825_n.jpg"
    }
    
    override func getNewsSourceTitle() -> String {
        return "INSURANCE POST Tech";
    }
    
    override func getBackgroundColor() -> (start: CGColor, end: CGColor) {
        return (start: UIColor(0xCF000F).cgColor, end: UIColor(0xE3000E).cgColor)
    }
}
