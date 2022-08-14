//
//  MainCoordinator.swift
//  MorningNews
//
//  Created by muhammad osama on 8/14/22.
//

import UIKit

/**
 MainCoordinator is responsible for handling the navigation login
 */
class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.prefersLargeTitles = true
    }
    
    var newsRepository: NewsRepositoryProtocol {
        return NewsRepository()
    }
    
    var newsUseCase: NewsUseCaseProtocol {
        return NewsUseCase(newsRepository: newsRepository)
    }
    
    var viewModel: NewsListViewModelProtocol {
        return NewsListViewModel(newsUseCase: newsUseCase,coordinator: self)
    }
    
    func start() {
        let vc = NewsListViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func navigateToDetail(_ newsViewModel: NewsViewModel) {
        let vc = NewsDetailViewController(newsViewModel: newsViewModel)
        navigationController.pushViewController(vc, animated: false)
    }
}
