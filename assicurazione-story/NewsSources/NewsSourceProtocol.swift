//
//  NewsSourceProtocol.swift
//  assicurazione-story
//
//  Created by Eni Sinanaj on 13/08/2017.
//  Copyright © 2017 NewlineCode. All rights reserved.
//

import Foundation
import AlamofireRSSParser

enum NewsSourceType {
    case MONDO_ASSICURAZIONI
    case GENERALI
}

class NewsSourcesFactory {
    static func create(sourceType: NewsSourceType) -> NewsSourceProtocol {
        switch sourceType {
        case .GENERALI:
            return Generali()
        case .MONDO_ASSICURAZIONI:
            return MondoAssicurazioni()
        }
    }
}

protocol NewsSourceProtocol {
    func downloadNews(_ closure: () -> Void) -> RSSFeed
    func getNewsElements() -> [RSSItem]
    func getNewsSource() -> String
    
    func getNewsSourceTitle() -> String
    func getNewsSourceImage() -> UIImage
    func getBackgroundImageUrl() -> String
}
