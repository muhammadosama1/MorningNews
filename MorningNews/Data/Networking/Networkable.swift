//
//  Networkable.swift
//  MorningNews
//
//  Created by muhammad osama on 8/14/22.
//

import Foundation
import Moya

/**
    Networkable protocol represents the contruct that should be implemented be
    the caller of this api
 */
protocol Networkable {
    var provider: MoyaProvider<NewsAPI> { get }
    func getNews(success: @escaping ([NewsEntity])->Void,
                 failure: @escaping (String)->Void)
}
