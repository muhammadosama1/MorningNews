//
//  NewsUseCase.swift
//  MorningNews
//
//  Created by muhammad osama on 8/14/22.
//

import Foundation

/**
 NewsUseCaseProtocol is the contruct which describes properties and functionality of news
 useCase, used to achieve dependency inversion
 */
protocol NewsUseCaseProtocol {
    func loadNews(success: @escaping ([NewsEntity])->Void,
                  failure: @escaping (String)->Void)
}

/**
 NewUseCase meant to implement some business logic like rearranging data, sorting and search
 */
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
