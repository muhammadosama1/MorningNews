//
//  NewsAPI.swift
//  MorningNews
//
//  Created by muhammad osama on 8/14/22.
//

import Foundation
import Moya

/**
 NewsAPI respresent the moya endpoint of most popular news Api, it create the api final URL
 */
struct NewsAPI: TargetType {
    
    let period: NewsPeriod
    
    init(period: NewsPeriod = .weak) {
        self.period = period
    }
    
    var baseURL: URL {
        return URL(string: "https://api.nytimes.com/svc/")!
    }
    
    var path: String {
        return "mostpopular/v2/viewed/\(period.rawValue).json"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        return .requestParameters(
            parameters:
                ["api-key": Bundle.main.infoDictionary?["API_KEY"] as? String ?? ""],
            encoding: URLEncoding.queryString
        )
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}

/**
 NewsPeriod represents valid values for how far back in days which api accepts
 */
enum NewsPeriod: Int {
    case day = 1
    case weak = 7
    case month = 30
}
