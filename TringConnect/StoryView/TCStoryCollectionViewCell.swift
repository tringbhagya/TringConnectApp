//
//  TCStoryCollectionViewCell.swift
//  TringConnect
//
//  Created by Bhagya on 02/05/22.
//

import Foundation
import UIKit

class TCStoryCollectionViewCell: UICollectionViewCell {
    static let cellId = "TCStoryCollectionViewCell"
    
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var storyNameLabel: TCLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetUp()
    }
    
    func initialSetUp() {
        self.outerView.layer.cornerRadius = 30.0
        self.outerView.layer.borderColor = TCColorPalette.gray.color?.cgColor
        self.outerView.layer.borderWidth = 0.5
        
        self.imageView.layer.cornerRadius = 25.0
    }
    
    func configureUI(_ imageName: String, title: String) {
        self.imageView.image = UIImage(named: imageName)
        self.storyNameLabel.text = title
    }

}
