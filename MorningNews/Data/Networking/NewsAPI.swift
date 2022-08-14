//
//  NewsAPI.swift
//  MorningNews
//
//  Created by muhammad osama on 8/14/22.
//

import Foundation
import Moya

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
        //TODO: - add api key to seperate configurations file
        return .requestParameters(parameters: ["api-key": "2ZGeFUoL5NKPpc9WA2JrxGG0GK4HrLaJ"],
                                  encoding: URLEncoding.queryString)
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}

enum NewsPeriod: Int {
    case day = 1
    case weak = 7
    case month = 30
}
