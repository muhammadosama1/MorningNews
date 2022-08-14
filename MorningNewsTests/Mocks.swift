//
//  Mocks.swift
//  MorningNewsTests
//
//  Created by muhammad osama on 8/15/22.
//

@testable import MorningNews
import Foundation

struct NewsUseCaseMock: NewsUseCaseProtocol {
    var error: Error?
    var news: [NewsEntity] = []
    
    func loadNews(success: @escaping ([NewsEntity]) -> Void,
                  failure: @escaping (String) -> Void) {
        
        guard let _ = error else {
            success(news)
            return
        }
        failure(UserMessages.unExpectedError)
    }
}
