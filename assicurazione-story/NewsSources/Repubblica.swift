//
//  Repubblica.swift
//  assicurazione-story
//
//  Created by Eni Sinanaj on 21/04/2019.
//  Copyright © 2019 NewlineCode. All rights reserved.
//

import AlamofireRSSParser

class Repubblica: CommonNewsSourceProtocol {
    
    override func getNewsElements() -> [RSSItem] {
        return self.rssFeed!.items
    }
    
    override func getNewsSource() -> String {
        return "https://data.kataweb.it/rss/news24repubblica/rss2.0.xml"
    }
    
    override func getBackgroundImageUrl() -> String {
        return "https://c1.staticflickr.com/1/572/33165940281_16d24ef49e_n.jpg"
    }
    
    override func getNewsSourceTitle() -> String {
        return "Repubblica.it - 24Ore";
    }
    
    override func getBackgroundColor() -> (start: CGColor, end: CGColor) {
        return (start: UIColor(0x71C5F9).cgColor, end: UIColor(0x5A9DC7).cgColor)
    }
}
