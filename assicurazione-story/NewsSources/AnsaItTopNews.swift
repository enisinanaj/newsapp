//
//  AnsaItTopNew.swift
//  assicurazione-story
//
//  Created by Eni Sinanaj on 21/04/2019.
//  Copyright © 2019 NewlineCode. All rights reserved.
//

import AlamofireRSSParser

class AnsaItTopNews: CommonNewsSourceProtocol {
    
    override func getNewsElements() -> [RSSItem] {
        return self.rssFeed!.items
    }
    
    override func getNewsSource() -> String {
        return "https://www.ansa.it/sito/notizie/topnews/topnews_rss.xml"
    }
    
    override func getBackgroundImageUrl() -> String {
        return "https://c1.staticflickr.com/1/572/33165940281_16d24ef49e_n.jpg"
    }
    
    override func getNewsSourceTitle() -> String {
        return "ANSA.it - Ultima Ora";
    }
    
    override func getBackgroundColor() -> (start: CGColor, end: CGColor) {
        return (start: UIColor(0x008D23).cgColor, end: UIColor(0x4CAF65).cgColor)
    }
}

class AnsaItMondo: CommonNewsSourceProtocol {
    
    override func getNewsElements() -> [RSSItem] {
        return self.rssFeed!.items
    }
    
    override func getNewsSource() -> String {
        return "https://www.ansa.it/sito/notizie/mondo/mondo_rss.xml"
    }
    
    override func getBackgroundImageUrl() -> String {
        return "https://c1.staticflickr.com/1/572/33165940281_16d24ef49e_n.jpg"
    }
    
    override func getNewsSourceTitle() -> String {
        return "ANSA.it - Mondo";
    }
    
    override func getBackgroundColor() -> (start: CGColor, end: CGColor) {
        return (start: UIColor(0xDB2E59).cgColor, end: UIColor(0xDE4269).cgColor)
    }
}
