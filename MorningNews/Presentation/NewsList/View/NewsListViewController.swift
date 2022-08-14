//
//  NewsListViewController.swift
//  TechTask
//
//  Created by muhammad osama on 8/12/22.
//

import UIKit

final class NewsListViewController: CustomViewController {
    
    //MARK: - properties
    private let viewModel: NewsListViewModelProtocol
    private lazy var containerView: NewsListVeiw = {
        return view as! NewsListVeiw
    }()
    
    //MARK: - initialization
    init(viewModel: NewsListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: "NewsListVeiw", bundle: nil)
        containerView.articleSelected = articleDidSelect
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(code:) has not been implemented")
    }
    
    //MARK: - Lifecycle events
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Morning News"
        bind()
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    /*
     handing user tab on article, and it askes
     the viewModel to navigate to detail
     */
    private lazy var articleDidSelect: ((Int)->Void)? = { index in
        self.viewModel.didSelectItemAt(index)
    }
    
    //MARK: - binding viewModel
    private func bind() {
        viewModel.state.observe(on: self) { [weak self] state in
            guard let self = self,
                    let state = state else { return }
            switch state {
            case .loading:
                self.startLoaderIn(view: self.containerView)
            case .success:
                self.stopLoader()
                self.containerView.show(headlines: self.viewModel.headLines)
            case .error(let message):
                self.stopLoader()
                self.containerView.show(error: message)
            }
        }
    }
}

