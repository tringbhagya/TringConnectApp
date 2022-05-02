//
//  TCNewStoryCollectionViewCell.swift
//  TringConnect
//
//  Created by Bhagya on 02/05/22.
//

import Foundation
import UIKit

class TCNewStoryCollectionViewCell: UICollectionViewCell {
    static let cellId = "TCNewStoryCollectionViewCell"

    @IBOutlet weak var addStoryButton: TCButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        addStoryButton.setImageNames(TCConstant.kAddStory, selectedIcon: TCConstant.kAddStorySelected)
    }
    
}
