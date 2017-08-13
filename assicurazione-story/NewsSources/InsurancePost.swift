//
//  InsurancePost.swift
//  assicurazione-story
//
//  Created by Eni Sinanaj on 13/08/2017.
//  Copyright © 2017 NewlineCode. All rights reserved.
//

import AlamofireRSSParser

class InsurancePost: CommonNewsSourceProtocol {
    
    override func getNewsElements() -> [RSSItem] {
        return self.rssFeed!.items
    }
    
    override func getNewsSource() -> String {
        return "https://www.postonline.co.uk/feeds/rss/category/europe/italy"
    }
    
    override func getBackgroundImageUrl() -> String {
        return "https://c2.staticflickr.com/8/7003/6812695893_9e217df825_n.jpg"
    }
    
    override func getNewsSourceTitle() -> String {
        return "INSURANCE POST";
    }
}
