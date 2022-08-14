//
//  NewsUseCase.swift
//  MorningNews
//
//  Created by muhammad osama on 8/14/22.
//

import Foundation

protocol NewsUseCaseProtocol {
    func loadNews(success: @escaping ([NewsEntity])->Void,
                  failure: @escaping (String)->Void)
}

final class NewsUseCase: NewsUseCaseProtocol {
    
    let newsRepository: NewsRepositoryProtocol
    
    init(newsRepository: NewsRepositoryProtocol) {
        self.newsRepository = newsRepository
    }
    
    func loadNews(success: @escaping ([NewsEntity])->Void,
                  failure: @escaping (String)->Void) {
        
        newsRepository.getNews(success: success,
                               failure: failure)
    }
}
