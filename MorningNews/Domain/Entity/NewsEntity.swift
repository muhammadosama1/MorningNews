//
//  NewsEntity.swift
//  MorningNews
//
//  Created by muhammad osama on 8/14/22.
//

import Foundation

/**
 NewsEntity is Domain Entity for News Response
 */
struct NewsEntity {
    let url: String
    let id: Int
    let source: String
    let publishedDate: String
    let section: String
    let subsection: String
    let byline: String
    let title: String
    let abstract: String
    let media: [Media]
}

struct Media {
    let type: String
    let subtype: String
    let caption: String
    let mediaMetadata: [MediaMetadata]
}

struct MediaMetadata {
    let url: String
    let format: String
    let height, width: Int
}
