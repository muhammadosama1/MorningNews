//
//  NewsListView.swift
//  TechTask
//
//  Created by muhammad osama on 8/14/22.
//

import UIKit

final class NewsListVeiw: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    
    private var headlinesArray = [String]()
    var articleSelected: ((Int)->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func show(headlines: [String]) {
        errorView.isHidden = true
        headlinesArray = headlines
        tableView.reloadData()
    }
    
    func show(error: String) {
        errorView.isHidden = false
        errorLabel.text = error
    }
}

extension NewsListVeiw: UITableViewDataSource,
                        UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return headlinesArray.count
    }
    
    func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = headlinesArray[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        articleSelected?(indexPath.row)
    }
}
