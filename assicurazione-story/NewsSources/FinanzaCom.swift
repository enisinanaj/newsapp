//
//  Finanza.swift
//  assicurazione-story
//
//  Created by Eni Sinanaj on 13/08/2017.
//  Copyright © 2017 NewlineCode. All rights reserved.
//

import AlamofireRSSParser

class FinanzaCom: CommonNewsSourceProtocol {
    
    override func getNewsElements() -> [RSSItem] {
        return self.rssFeed!.items
    }
    
    override func getNewsSource() -> String {
        return "https://www.finanza.com/rssfeed/"
    }
    
    override func getBackgroundImageUrl() -> String {
        return "https://c1.staticflickr.com/5/4229/35854436835_1b653c198c_n.jpg"
    }
    
    override func getNewsSourceTitle() -> String {
        return "FINANZA.COM";
    }
}

