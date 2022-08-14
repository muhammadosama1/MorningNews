//
//  ViewModelState.swift
//  MorningNews
//
//  Created by muhammad osama on 8/14/22.
//

import Foundation

enum ViewModelState: Equatable {
    case loading
    case success
    case error(message: String)
}
