//
//  Corriere.swift
//  assicurazione-story
//
//  Created by Eni Sinanaj on 21/04/2019.
//  Copyright © 2019 NewlineCode. All rights reserved.
//

import AlamofireRSSParser

class Corriere: CommonNewsSourceProtocol {
    
    override func getNewsElements() -> [RSSItem] {
        return self.rssFeed!.items
    }
    
    override func getNewsSource() -> String {
        return "https://xml2.corriereobjects.it/rss/homepage.xml"
    }
    
    override func getBackgroundImageUrl() -> String {
        return "https://c1.staticflickr.com/1/572/33165940281_16d24ef49e_n.jpg"
    }
    
    override func getNewsSourceTitle() -> String {
        return "Corriere della Sera - Tutte le notizie";
    }
    
    override func getBackgroundColor() -> (start: CGColor, end: CGColor) {
        return (start: UIColor(0xE3641E).cgColor, end: UIColor(0x9E4615).cgColor)
    }
}

class CorriereEsteri: CommonNewsSourceProtocol {
    
    override func getNewsElements() -> [RSSItem] {
        return self.rssFeed!.items
    }
    
    override func getNewsSource() -> String {
        return "https://xml2.corriereobjects.it/rss/esteri.xml"
    }
    
    override func getBackgroundImageUrl() -> String {
        return "https://c1.staticflickr.com/1/572/33165940281_16d24ef49e_n.jpg"
    }
    
    override func getNewsSourceTitle() -> String {
        return "Corriere della Sera - Esteri";
    }
    
    override func getBackgroundColor() -> (start: CGColor, end: CGColor) {
        return (start: UIColor(0x15299E).cgColor, end: UIColor(0x10207E).cgColor)
    }
}

