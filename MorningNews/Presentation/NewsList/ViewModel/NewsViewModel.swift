//
//  NewsViewModel.swift
//  MorningNews
//
//  Created by muhammad osama on 8/14/22.
//

import Foundation

struct NewsViewModel {
    let title: String
    let caption: String
    let author: String
    let description: String
    let publishedDate: String
    let imageUrl: String
    
    init(newsEntity: NewsEntity) {
        title = newsEntity.title
        caption = newsEntity.media.first?.caption ?? ""
        author = newsEntity.byline
        description = newsEntity.abstract
        publishedDate = newsEntity.publishedDate
        imageUrl = newsEntity.media[2].mediaMetadata.first?.url ?? ""
    }
}
