//
//  NewsListViewModelTest.swift
//  MorningNewsTests
//
//  Created by muhammad osama on 8/15/22.
//

@testable import MorningNews
import XCTest

class NewsListViewModelTest: XCTestCase {
    
    struct NewsError: Error {}
    
    var newsArray = [NewsEntity.stub(id: 1),
                     NewsEntity.stub(id: 2),
                     NewsEntity.stub(id: 3),
                     NewsEntity.stub(id: 4)]
    
    func test_whenPassingDataFromUserCase_thatViewModelViewsIt() {
        var useCase = NewsUseCaseMock()
        useCase.news = newsArray
        let viewModel = NewsListViewModel(newsUseCase: useCase,
                                          coordinator: MainCoordinator(navigationController: UINavigationController()))
        
        viewModel.viewDidLoad()
        
        XCTAssertEqual(viewModel.state.value, .success)
        XCTAssertEqual(viewModel.headLines, newsArray.map({$0.title}))
    }
    
    func test_whenPassingErrorFromUserCase_thatViewModelViewSendErrorStateWithMessage() {
        var useCase = NewsUseCaseMock()
        useCase.error = NewsError()
        let viewModel = NewsListViewModel(newsUseCase: useCase,
                                          coordinator: MainCoordinator(navigationController: UINavigationController()))
        
        viewModel.viewDidLoad()
        
        XCTAssertEqual(viewModel.state.value, .error(message: UserMessages.unExpectedError))
    }

}

