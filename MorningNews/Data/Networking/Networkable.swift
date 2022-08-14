//
//  Networkable.swift
//  MorningNews
//
//  Created by muhammad osama on 8/14/22.
//

import Foundation
import Moya

protocol Networkable {
    var provider: MoyaProvider<NewsAPI> { get }
    func getNews(success: @escaping ([NewsEntity])->Void,
                 failure: @escaping (String)->Void)
}
