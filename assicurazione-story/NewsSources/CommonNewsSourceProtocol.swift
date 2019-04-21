//
//  CommonNewsSourceProtocol.swift
//  assicurazione-story
//
//  Created by Eni Sinanaj on 13/08/2017.
//  Copyright © 2017 NewlineCode. All rights reserved.
//

import AlamofireRSSParser

class CommonNewsSourceProtocol: NewsSourceProtocol {    
    
    let NEWS_SOURCE_URL: String = "";
    
    var rssFeed: RSSFeed?;
    
    func downloadNews(_ closure: @escaping () -> Void) {
        RSSParser.getRSSFeedResponse(path: getNewsSource()) { (rssFeed: RSSFeed?, status: NetworkResponseStatus) in
            print(rssFeed ?? "null") // it will be nil if status == .error
            self.rssFeed = rssFeed
            closure()
        }
    }
    
    func getRssFeed() -> RSSFeed? {
        return self.rssFeed
    }
    
    func getNewsElements() -> [RSSItem] {
        return []
    }
    
    func getNewsSource() -> String {
        return NEWS_SOURCE_URL
    }
    
    func getNewsSourceTitle() -> String {
        return ""
    }
    
    func getNewsSourceImage() -> UIImage {
        if let imageUrl = NSURL(string: getBackgroundImageUrl()) {
            if let data = NSData(contentsOf: imageUrl as URL) {
                return UIImage(data: data as Data)!
            }
        }
        
        return UIImage()
    }
    
    func getBackgroundImageUrl() -> String {
        return ""
    }
    
    func getBackgroundColor() -> (start: CGColor, end: CGColor) {
        return (start: UIColor(0xCF000F).cgColor, end: UIColor(0xE3000E).cgColor)
    }
}
