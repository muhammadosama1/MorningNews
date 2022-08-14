//
//  NewsResponseMapper.swift
//  MorningNews
//
//  Created by muhammad osama on 8/14/22.
//

import Foundation

extension NewsListResultResponse {
    func mapping() -> NewsEntity {
        return NewsEntity(url: url,
                          id: id,
                          source: source,
                          publishedDate: publishedDate,
                          section: section,
                          subsection: subsection,
                          byline: byline,
                          title: title,
                          abstract: abstract,
                          media: media.map({$0.mapping()}))
    }
}

extension MediaRsponse {
    func mapping() -> Media {
        return Media(type: type,
                     subtype: subtype,
                     caption: caption, mediaMetadata: mediaMetadata.map({ $0.mapping() }))
    }
}

extension MediaMetadataResponse {
    func mapping() -> MediaMetadata {
        return MediaMetadata(url: url,
                             format: format,
                             height: height,
                             width: width)
    }
}

