//
//  NewsListViewModel.swift
//  MorningNews
//
//  Created by muhammad osama on 8/14/22.
//

import Foundation

/**
 inputProtocol represent the events triggered from the view controller
 */
protocol NewsListViewModelInput {
    func viewDidLoad()
    func didSelectItemAt(_ index: Int)
}

/**
 outputProtocol represent the output result of the previously triggered event
 */
protocol NewsListViewModelOutput {
    var state: Observable<ViewModelState?> { get }
    var headLines: [String] { get }
}

protocol NewsListViewModelProtocol: NewsListViewModelInput,
                                        NewsListViewModelOutput {}

final class NewsListViewModel: NewsListViewModelProtocol {
    
    private let newsUseCase: NewsUseCaseProtocol
    private let coordinator: MainCoordinator
    private var items = [NewsEntity]()
    var state: Observable<ViewModelState?> = Observable(nil)
    
    init(newsUseCase: NewsUseCaseProtocol, coordinator: MainCoordinator) {
        self.newsUseCase = newsUseCase
        self.coordinator = coordinator
    }
    
    var headLines: [String] {
        return items.map({$0.title})
    }
    
    /**
     askes the use case for the most popular news and revails the current state
     */
    func fetchData() {
        state.value = .loading
        newsUseCase.loadNews { [weak self] newsList in
            guard let self = self else { return }
            guard !newsList.isEmpty else {
                self.state.value = .error(message: UserMessages.emptyList)
                return
            }
            self.items = newsList
            self.state.value = .success
        } failure: { [weak self] error in
            guard let self = self else { return }
            self.state.value = .error(message: error)
        }
    }
    
    /**
     returns the New
     */
    func itemAt(index: Int) -> NewsViewModel? {
        guard items.count > index else { return nil }
        return NewsViewModel(newsEntity: items[index])
    }
}

/**
 Handling View triggered events
 */
extension NewsListViewModel {
    func viewDidLoad() {
        self.fetchData()
    }
    
    func didSelectItemAt(_ index: Int) {
        guard let item = itemAt(index: index) else { return }
        coordinator.navigateToDetail(item)
    }
}
