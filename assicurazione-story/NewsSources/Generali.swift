//
//  Generali.swift
//  assicurazione-story
//
//  Created by Eni Sinanaj on 13/08/2017.
//  Copyright © 2017 NewlineCode. All rights reserved.
//

import AlamofireRSSParser

class Generali: CommonNewsSourceProtocol {
    
    override func getNewsElements() -> [RSSItem] {
        return self.rssFeed!.items
    }
    
    override func getNewsSource() -> String {
        return "https://www.generali.com/.rest/rss/v1/feed?name=pressReleases"
    }
    
    override func getBackgroundImageUrl() -> String {
        return "https://c1.staticflickr.com/5/4147/5054293187_1679260abb_n.jpg"
    }
    
    override func getNewsSourceTitle() -> String {
        return "GENERALI - Comunicati stampa";
    }
}
