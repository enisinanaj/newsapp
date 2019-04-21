//
//  MondoAssicurazioni.swift
//  assicurazione-story
//
//  Created by Eni Sinanaj on 13/08/2017.
//  Copyright © 2017 NewlineCode. All rights reserved.
//

import AlamofireRSSParser

class TGCOM24Politica: CommonNewsSourceProtocol {
    
    override func getNewsElements() -> [RSSItem] {
        return self.rssFeed!.items
    }
    
    override func getNewsSource() -> String {
        return "http://www.tgcom24.mediaset.it/rss/politica.xml"
    }
    
    override func getBackgroundImageUrl() -> String {
        return "https://c1.staticflickr.com/1/572/33165940281_16d24ef49e_n.jpg"
    }
    
    override func getNewsSourceTitle() -> String {
        return "TGCOM24 Politica";
    }
    
    override func getBackgroundColor() -> (start: CGColor, end: CGColor) {
        return (start: UIColor(0xD22752).cgColor, end: UIColor(0x7E1731).cgColor)
    }
}

class TGCOM24Mondo: CommonNewsSourceProtocol {
    
    override func getNewsElements() -> [RSSItem] {
        return self.rssFeed!.items
    }
    
    override func getNewsSource() -> String {
        return "http://www.tgcom24.mediaset.it/rss/mondo.xml"
    }
    
    override func getBackgroundImageUrl() -> String {
        return "https://c1.staticflickr.com/1/572/33165940281_16d24ef49e_n.jpg"
    }
    
    override func getNewsSourceTitle() -> String {
        return "TGCOM24 Mondo";
    }
    
    override func getBackgroundColor() -> (start: CGColor, end: CGColor) {
        return (start: UIColor(0x12226C).cgColor, end: UIColor(0x0A1440).cgColor)
    }
}

class TGCOM24Sport: CommonNewsSourceProtocol {
    
    override func getNewsElements() -> [RSSItem] {
        return self.rssFeed!.items
    }
    
    override func getNewsSource() -> String {
        return "https://www.tgcom24.mediaset.it/rss/sport.xml"
    }
    
    override func getBackgroundImageUrl() -> String {
        return "https://c1.staticflickr.com/1/572/33165940281_16d24ef49e_n.jpg"
    }
    
    override func getNewsSourceTitle() -> String {
        return "TGCOM24 Sport";
    }
    
    override func getBackgroundColor() -> (start: CGColor, end: CGColor) {
        return (start: UIColor(0x177E5C).cgColor, end: UIColor(0x105840).cgColor)
    }
}
