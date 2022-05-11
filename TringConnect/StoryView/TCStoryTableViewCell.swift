//
//  StoryTableViewCell.swift
//  TringConnect
//
//  Created by Bhagya on 02/05/22.
//

import Foundation
import UIKit

class TCStoryTableViewCell: UITableViewCell {
    static let cellId = "TCStoryTableViewCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let storyImages = ["story1", "story2", "story3", "story4", "story5"]
    let storyTitles = ["HR Team", "Creactive Bees", "TechMads", "Cloud 9", "Terrific Tringers"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let newStoryCellNib = UINib(nibName: TCNewStoryCollectionViewCell.cellId, bundle: nil)
        self.collectionView.register(newStoryCellNib, forCellWithReuseIdentifier: TCNewStoryCollectionViewCell.cellId)
        
        let storyCellNib = UINib(nibName: TCStoryCollectionViewCell.cellId, bundle: nil)
        self.collectionView.register(storyCellNib, forCellWithReuseIdentifier: TCStoryCollectionViewCell.cellId)

        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
}

extension TCStoryTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyImages.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TCNewStoryCollectionViewCell.cellId, for: indexPath) as? TCNewStoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TCStoryCollectionViewCell.cellId, for: indexPath) as? TCStoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            let index = indexPath.item - 1
            cell.configureUI(storyImages[index], title: storyTitles[index])
            return cell
        }
    }
}


extension TCStoryTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60.0, height: 75.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        15.0
    }
}
