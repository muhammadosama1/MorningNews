//
//  Coordinator.swift
//  MorningNews
//
//  Created by muhammad osama on 8/14/22.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
