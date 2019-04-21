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
    case INSURANCE_POST
    case INSURANCE_POST_RISK_MANAGEMENT
    case INSURANCE_POST_REGULATION
    case THE_WALL_STREET_JOURNAL
    case BBC_NEWS
    case PEW_RESEARCH_CENTER
    case REUTERS_WORLD_NEWS
    case HUFF_WORLD_NEWS
    case HUFF_POLITICS
    case TIME_WORLD
    case TIME_SCIENCE
    case AD
}

class NewsSourcesFactory {
    static func create(sourceType: NewsSourceType) -> NewsSourceProtocol? {
        switch sourceType {
        case .INSURANCE_POST:
            return InsurancePost()
        case .INSURANCE_POST_RISK_MANAGEMENT:
            return InsurancePostRiskManagement()
        case .INSURANCE_POST_REGULATION:
            return InsurancePostRegulation()
        case .AD:
            return nil
        case .THE_WALL_STREET_JOURNAL:
            return TheWallStreetJournal()
        case .BBC_NEWS:
            return BBCNews()
        case .REUTERS_WORLD_NEWS:
            return ReutersWorldNews()
        case .PEW_RESEARCH_CENTER:
            return PewResearchCenter()
        case .HUFF_WORLD_NEWS:
            return HuffWorldNews()
        case .HUFF_POLITICS:
            return HuffPolitics()
        case .TIME_WORLD:
            return TimeWorld()
        case .TIME_SCIENCE:
            return TimeScience()
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
