//
//  NewsDetailViewController.swift
//  TechTask
//
//  Created by muhammad osama on 8/13/22.
//

import UIKit

final class NewsDetailViewController: UIViewController {
    
    //MARK: - properties
    private let newsViewModel: NewsViewModel
    private lazy var containerView: NewsDetailView = {
        return view as! NewsDetailView
    }()
    
    //MARK: - initialization
    init(newsViewModel: NewsViewModel) {
        self.newsViewModel = newsViewModel
        super.init(nibName: "NewsDetailView", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle event
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        containerView.show(data: newsViewModel)
    }
}
