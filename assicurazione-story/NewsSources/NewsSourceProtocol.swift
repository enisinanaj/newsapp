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
    case ANSA_IT
    case ANSA_IT_WORLD
    case TGCOM24
    case TGCOM24Politics
    case TGCOM24SPORT
    case REPUBBLICA
    case CORRIERE
    case CORRIERE_ESTERI
    case AD
}

class NewsSourcesFactory {
    static func create(sourceType: NewsSourceType) -> NewsSourceProtocol? {
        switch sourceType {
        case .ANSA_IT:
            return AnsaItTopNews()
        case .ANSA_IT_WORLD:
            return AnsaItMondo()
        case .TGCOM24:
            return TGCOM24Mondo()
        case .TGCOM24Politics:
            return TGCOM24Politica()
        case .TGCOM24SPORT:
            return TGCOM24Sport()
        case .REPUBBLICA:
            return Repubblica()
        case .CORRIERE:
            return Corriere()
        case .CORRIERE_ESTERI:
            return CorriereEsteri()
        case .AD:
            return nil
        }
        
    }
}

protocol NewsSourceProtocol {
    func downloadNews(_ closure: @escaping () -> Void)
    func getRssFeed() -> RSSFeed?
    func getNewsElements() -> [RSSItem]
    func getNewsSource() -> String
    
    func getNewsSourceTitle() -> String
    func getNewsSourceImage() -> UIImage
    func getBackgroundImageUrl() -> String
    func getBackgroundColor() -> (start: CGColor, end: CGColor)
}
