//
//  PewResearchCenter.swift
//  assicurazione-story
//
//  Created by Eni Sinanaj on 21/04/2019.
//  Copyright © 2019 NewlineCode. All rights reserved.
//

import AlamofireRSSParser

class PewResearchCenter: CommonNewsSourceProtocol {
    
    override func getNewsElements() -> [RSSItem] {
        return self.rssFeed!.items
    }
    
    override func getNewsSource() -> String {
        return "https://www.pewresearch.org/feed/"
    }
    
    override func getBackgroundImageUrl() -> String {
        return "https://c2.staticflickr.com/8/7003/6812695893_9e217df825_n.jpg"
    }
    
    override func getNewsSourceTitle() -> String {
        return "Pew Research Center";
    }
    
    override func getBackgroundColor() -> (start: CGColor, end: CGColor) {
        return (start: UIColor(0x94B3AD).cgColor, end: UIColor(0xB9E0D9).cgColor)
    }
}
