//
//  TCCourseTableViewCell.swift
//  TringConnect
//
//  Created by Bhagya on 02/05/22.
//

import Foundation
import UIKit

class TCCourseTableViewCell: UITableViewCell {
    
    static let cellId = "TCCourseTableViewCell"
    
    @IBOutlet weak var likeCommentSection: TCLikeCommentSectionView!
    @IBOutlet weak var titleLabel: TCLabel!
    @IBOutlet weak var moreButton: TCButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var items: [TCCourse] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetUp()
    }
    
    func initialSetUp() {
        self.moreButton.setImageNames(TCConstant.kMoreIcon, selectedIcon: TCConstant.kMoreIconSelected)
        
        let courseCellNib = UINib(nibName: TCCourseCollectionViewCell.cellId, bundle: nil)
        self.collectionView.register(courseCellNib, forCellWithReuseIdentifier: TCCourseCollectionViewCell.cellId)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func configureUI(_ feedData: TCFeed) {
        self.items = feedData.media?.courses ?? []
        self.collectionView.reloadData()
        likeCommentSection.configureUI(feedData)
    }
}

extension TCCourseTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TCCourseCollectionViewCell.cellId, for: indexPath) as? TCCourseCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureUI(self.items[indexPath.item])
        return cell
    }
}

extension TCCourseTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 390.0, height: 270.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        21.0
    }
}
