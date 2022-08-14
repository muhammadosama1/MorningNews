//
//  NewsDetailViewController.swift
//  TechTask
//
//  Created by muhammad osama on 8/13/22.
//

import UIKit

final class NewsDetailViewController: UIViewController {
    
    private let newsEntity: NewsEntity
    private lazy var containerView: NewsDetailView = {
        return view as! NewsDetailView
    }()
    
    init(newsEntity: NewsEntity) {
        self.newsEntity = newsEntity
        super.init(nibName: "NewsDetailView", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        containerView.show(data: newsEntity)
    }
}
