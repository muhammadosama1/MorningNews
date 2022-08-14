//
//  NewsDetailView.swift
//  TechTask
//
//  Created by muhammad osama on 8/13/22.
//

import UIKit
import Nuke

final class NewsDetailView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var imageCaption: UILabel!
    @IBOutlet weak var writerNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func show(data: NewsEntity) {
        titleLabel.text = data.title
        imageCaption.text = data.media.first?.caption
        writerNameLabel.text = data.byline
        descriptionLabel.text = data.abstract
        publishedDateLabel.text = data.publishedDate
        guard let imageUrl = data.media.first?.mediaMetadata.first?.url,
              let url = URL(string: imageUrl) else { return }
        Nuke.loadImage(with: url, into: articleImageView)
    }
}
