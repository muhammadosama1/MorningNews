//
//  NewsEntityStub.swift
//  MorningNewsTests
//
//  Created by muhammad osama on 8/15/22.
//

import Foundation
@testable import MorningNews

extension NewsEntity {
    static func stub(id: Int) -> NewsEntity {
        return
            NewsEntity(url: "www.test.com",
                       id: id,
                       source: "EG",
                       publishedDate: "14/8/2022",
                       section: "EG",
                       subsection: "Test Subsection",
                       byline: "Muhammad",
                       title: "Test Title",
                       abstract: "",
                       media: [Media.stub(),
                               Media.stub()])
        
    }
}

extension Media {
    static func stub() -> Media {
        return Media(type: "image",
                     subtype: "photo",
                     caption: "Test caption",
                     mediaMetadata: [MediaMetadata.stub(),
                                     MediaMetadata.stub()])
    }
}

extension MediaMetadata {
    static func stub() -> MediaMetadata {
        return MediaMetadata(url: "https://picsum.photos/200/300",
                             format: "mediumThreeByTwo440",
                             height: 200,
                             width: 200)
    }
}

