//
//  CustomViewController.swift
//  MorningNews
//
//  Created by muhammad osama on 8/14/22.
//

import UIKit

class CustomViewController: UIViewController {
    
    var spinner = UIActivityIndicatorView()
 
    func startLoaderIn(view: UIView) {
        spinner.style = .large
        spinner.backgroundColor = .lightGray.withAlphaComponent(0.35)
        spinner.layer.cornerRadius = 12
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)
        spinner.widthAnchor.constraint(equalToConstant: 65).isActive = true
        spinner.heightAnchor.constraint(equalToConstant: 65).isActive = true
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func stopLoader() {
        spinner.stopAnimating()
        spinner.removeFromSuperview()
    }
}
