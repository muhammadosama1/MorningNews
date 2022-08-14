//
//  NewsResponse.swift
//  MorningNews
//
//  Created by muhammad osama on 8/14/22.
//

import Foundation

/**
    NewsListResultResponse is a Data Entity, it should be used only inside data layer
 */
struct NewsListResponse: Codable {
    let status: String
    let numResults: Int?
    let results: [NewsListResultResponse]
    
    enum CodingKeys: String, CodingKey {
        case status
        case numResults = "num_results"
        case results
    }
}

struct NewsListResultResponse: Codable {
    let url: String
    let id: Int
    let source: String
    let publishedDate: String
    let section: String
    let subsection: String
    let byline: String
    let title: String
    let abstract: String
    let media: [MediaRsponse]
    
    enum CodingKeys: String, CodingKey {
        case url
        case id
        case source
        case publishedDate = "published_date"
        case section
        case subsection
        case byline
        case title
        case abstract
        case media
    }
}

struct MediaRsponse: Codable {
    let type: String
    let subtype: String
    let caption: String
    let mediaMetadata: [MediaMetadataResponse]
    
    enum CodingKeys: String, CodingKey {
        case type
        case subtype
        case caption
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetadataResponse: Codable {
    let url: String
    let format: String
    let height, width: Int
}

enum Subtype: Codable {
    case photo
}

enum MediaType: Codable {
    case image
}

