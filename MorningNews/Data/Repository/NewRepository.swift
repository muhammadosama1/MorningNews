//
//  NewRepository.swift
//  MorningNews
//
//  Created by muhammad osama on 8/14/22.
//

import Foundation
import Moya

/**
    NewsRepository responsible for fetching remote data and caching,
 updating and deleting data from local if needed 
 */
struct NewsRepository: Networkable, NewsRepositoryProtocol {
    
    var provider = MoyaProvider<NewsAPI>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
    
    func getNews(success: @escaping ([NewsEntity]) -> Void,
                 failure: @escaping (String) -> Void) {
        
        provider.request(NewsAPI()) { result in
            switch result {
            case .success(let response):
                do {
                    let results = try JSONDecoder().decode(NewsListResponse.self,
                                                           from: response.data)
                    success(results.results.map({$0.mapping()}))
                } catch {
                    failure(error.localizedDescription)
                }
            case .failure(let error):
                failure(error.localizedDescription)
            }
        }
    }
}
