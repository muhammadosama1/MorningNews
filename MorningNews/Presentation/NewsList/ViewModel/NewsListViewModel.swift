//
//  NewsListViewModel.swift
//  MorningNews
//
//  Created by muhammad osama on 8/14/22.
//

import Foundation

protocol NewsListViewModelInput {
    func viewDidLoad()
    func didSelectItemAt(_ index: Int)
}

protocol NewsListViewModelOutput {
    var state: Observable<ViewModelState?> { get }
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
    
    func itemAt(index: Int) -> NewsEntity? {
        guard items.count > index else { return nil }
        return items[index]
    }
}

extension NewsListViewModel {
    func viewDidLoad() {
        self.fetchData()
    }
    
    func didSelectItemAt(_ index: Int) {
        guard let item = itemAt(index: index) else { return }
        coordinator.navigateToDetail(item)
    }
}
