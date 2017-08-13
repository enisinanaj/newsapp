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
    case IVASS
    case INSURANCE_POST
    case FINANZA_COM
}

class NewsSourcesFactory {
    static func create(sourceType: NewsSourceType) -> NewsSourceProtocol {
        switch sourceType {
        case .GENERALI:
            return Generali()
        case .IVASS:
            return IVASS()
        case .MONDO_ASSICURAZIONI:
            return MondoAssicurazioni()
        case .INSURANCE_POST:
            return InsurancePost()
        case .FINANZA_COM:
            return FinanzaCom()
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
}
