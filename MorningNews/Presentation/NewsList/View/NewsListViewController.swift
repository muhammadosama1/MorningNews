//
//  NewsListViewController.swift
//  TechTask
//
//  Created by muhammad osama on 8/12/22.
//

import UIKit

final class NewsListViewController: CustomViewController {
    
    private let viewModel: NewsListViewModel
    private lazy var containerView: NewsListVeiw = {
        return view as! NewsListVeiw
    }()
    
    init(viewModel: NewsListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "NewsListVeiw", bundle: nil)
        containerView.articleSelected = articleDidSelect
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(code:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        bind()
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private lazy var articleDidSelect: ((Int)->Void)? = { index in
        self.viewModel.didSelectItemAt(index)
    }
    
    private func configureView() {
        title = "Morning News"
    }
    
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

