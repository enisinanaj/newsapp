//
//  FoxNewsWorld.swift
//  assicurazione-story
//
//  Created by Eni Sinanaj on 21/04/2019.
//  Copyright © 2019 NewlineCode. All rights reserved.
//

import AlamofireRSSParser

class TimeWorld: CommonNewsSourceProtocol {
    
    override func getNewsElements() -> [RSSItem] {
        return self.rssFeed!.items
    }
    
    override func getNewsSource() -> String {
        return "https://feeds.feedburner.com/time/world?format=xml"
    }
    
    override func getBackgroundImageUrl() -> String {
        return "https://c2.staticflickr.com/8/7003/6812695893_9e217df825_n.jpg"
    }
    
    override func getNewsSourceTitle() -> String {
        return "TIME - World";
    }
    
    override func getBackgroundColor() -> (start: CGColor, end: CGColor) {
        return (start: UIColor(0xBE1931).cgColor, end: UIColor(0x851122).cgColor)
    }
}

class TimeScience: CommonNewsSourceProtocol {
    
    override func getNewsElements() -> [RSSItem] {
        return self.rssFeed!.items
    }
    
    override func getNewsSource() -> String {
        return "https://feeds.feedburner.com/time/scienceandhealth?format=xml"
    }
    
    override func getBackgroundImageUrl() -> String {
        return "https://c2.staticflickr.com/8/7003/6812695893_9e217df825_n.jpg"
    }
    
    override func getNewsSourceTitle() -> String {
        return "TIME - Science";
    }
    
    override func getBackgroundColor() -> (start: CGColor, end: CGColor) {
        return (start: UIColor(0xc91a33).cgColor, end: UIColor(0xb2172e).cgColor)
    }
}
