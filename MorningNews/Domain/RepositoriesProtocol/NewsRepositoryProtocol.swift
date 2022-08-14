//
//  NewsRepositoryProtocol.swift
//  MorningNews
//
//  Created by muhammad osama on 8/14/22.
//

import Foundation
import Moya

/**
    NewsRepositoryProtocol is the contruct which describes properties and functionality of news
 repository, used to achieve dependency inversion
 */
protocol NewsRepositoryProtocol {
    var provider: MoyaProvider<NewsAPI> { get }
    func getNews(success: @escaping ([NewsEntity]) -> Void,
                 failure: @escaping (String) -> Void)
}
