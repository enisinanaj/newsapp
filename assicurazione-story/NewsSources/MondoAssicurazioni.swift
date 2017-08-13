//
//  MondoAssicurazioni.swift
//  assicurazione-story
//
//  Created by Eni Sinanaj on 13/08/2017.
//  Copyright © 2017 NewlineCode. All rights reserved.
//

import AlamofireRSSParser

class MondoAssicurazioni: CommonNewsSourceProtocol {
    
    override func getNewsElements() -> [RSSItem] {
        return self.rssFeed!.items
    }
    
    override func getNewsSource() -> String {
        return "https://feeds.feedburner.com/mondo-assicurazioni?format=xml"
    }
    
    override func getBackgroundImageUrl() -> String {
        return "https://c1.staticflickr.com/1/572/33165940281_16d24ef49e_n.jpg"
    }
    
    override func getNewsSourceTitle() -> String {
        return "Mondo Assicurazioni";
    }
}
