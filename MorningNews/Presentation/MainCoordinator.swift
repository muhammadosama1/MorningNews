//
//  MainCoordinator.swift
//  MorningNews
//
//  Created by muhammad osama on 8/14/22.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.prefersLargeTitles = true
    }

    func start() {
        let vc = NewsListViewController(viewModel: NewsListViewModel(newsUseCase: NewsUseCase(newsRepository: NewsRepository()), coordinator: self))
        navigationController.pushViewController(vc, animated: false)
    }
    
    func navigateToDetail(_ newsEntity: NewsEntity) {
        let vc = NewsDetailViewController(newsEntity: newsEntity)
        navigationController.pushViewController(vc, animated: false)
    }
}
