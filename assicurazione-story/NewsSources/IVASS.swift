//
//  IVAS.swift
//  assicurazione-story
//
//  Created by Eni Sinanaj on 13/08/2017.
//  Copyright © 2017 NewlineCode. All rights reserved.
//

import AlamofireRSSParser

class IVASS: CommonNewsSourceProtocol {
    
    override func getNewsElements() -> [RSSItem] {
        return self.rssFeed!.items
    }
    
    override func getNewsSource() -> String {
        return "https://www.ivass.it/util/index.rss.html?lingua=it"
    }
    
    override func getBackgroundImageUrl() -> String {
        return "https://www.intermediariassicurativi.it/images/risultati-esame-ivass-2014.jpg"
    }
    
    override func getNewsSourceTitle() -> String {
        return "IVASS";
    }
}
