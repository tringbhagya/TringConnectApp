//
//  TCFeedsTableViewCell.swift
//  TringConnect
//
//  Created by Bhagya on 01/05/22.
//

import UIKit

class TCFeedsTableViewCell: UITableViewCell {
    
    static let cellId = "TCFeedsTableViewCell"
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: TCLabel!
    @IBOutlet weak var roleLabel: TCLabel!
    @IBOutlet weak var moreButton: TCButton!

    @IBOutlet weak var postLabel: TCLabel!
    @IBOutlet weak var tagLabel: TCLabel!
    @IBOutlet weak var readMoreLabel: TCLabel!
    @IBOutlet weak var readMoreArrowButton: UIButton!
    
    @IBOutlet weak var mediaImageView: UIImageView!
    @IBOutlet weak var hybridView: UIView!
    @IBOutlet weak var bannerView: UIView!
    
    @IBOutlet var hybridImageViews: [UIImageView]!
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var bannerTitleLabel: TCLabel!
    @IBOutlet weak var bannerDurationLabel: TCLabel!
    
    @IBOutlet weak var likeCommentSection: TCLikeCommentSectionView!
    
    private let viewModel = TCFeedsTableViewCellViewModel()
    weak var delegate: TCMediaViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetUp()
    }
    
    func initialSetUp() {
        self.avatarImageView.layer.cornerRadius = 30.0
        
        self.nameLabel.labelType = viewModel.kNameLabelType
        self.roleLabel.labelType = viewModel.kRoleLabelType
        self.postLabel.labelType = viewModel.kPostLabelType
        self.tagLabel.labelType = viewModel.kTagLabelType
        self.readMoreLabel.labelType = viewModel.kReadMoreLabelType
        
        self.moreButton.setImageNames(TCConstant.kMoreIcon, selectedIcon: TCConstant.kMoreIconSelected)
        
        
        for hybridImageView in self.hybridImageViews {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(mediaTapped(gesture:)))
            tapGesture.numberOfTapsRequired = 1

            hybridImageView.isUserInteractionEnabled = true
            hybridImageView.addGestureRecognizer(tapGesture)
        }
    }
    
    @objc func mediaTapped(gesture: UIGestureRecognizer) {
        if let imageView = gesture.view as? UIImageView {
            let index = self.hybridImageViews.firstIndex(of: imageView) ?? 0
            delegate?.displayMediaGalleryView(viewModel.feedData?.media?.images ?? [], selectedIndex: index)

        }
    }
    
    func configureUI(_ feedData: TCFeed) {
        self.avatarImageView.image = UIImage(named: feedData.userAvatar ?? "")
        self.nameLabel.text = feedData.name
        self.roleLabel.text = feedData.role
        
        self.postLabel.text = feedData.post
        self.tagLabel.text = viewModel.getTagsText(feedData.tags)
        
        configureMediaViews(feedData)
        
        likeCommentSection.configureUI(feedData)
    }
    
    private func configureMediaViews(_ feedData: TCFeed) {
        viewModel.feedData = feedData
        if feedData.type == "post" {
            bannerView.isHidden = true
            hybridView.isHidden = true
            mediaImageView.isHidden = false
            if feedData.media?.images?.isEmpty == false {
                mediaImageView.image = UIImage(named: feedData.media?.images?.first ?? "")
            }
        } else if feedData.type == "hybrid_post" {
            bannerView.isHidden = true
            mediaImageView.isHidden = true
            hybridView.isHidden = false
                        
            if feedData.media?.images?.isEmpty == false {
                for (idx, hybridImageView) in self.hybridImageViews.enumerated() {
                    hybridImageView.image = UIImage(named: feedData.media?.images?[idx] ?? "")
                }
            }
            
        } else {
            hybridView.isHidden = true
            mediaImageView.isHidden = true
            bannerView.isHidden = false

            if let banner = feedData.media?.banner {
                bannerImageView.image = UIImage(named: banner.image ?? "")
                bannerTitleLabel.text = banner.title
                bannerDurationLabel.text = (banner.website ?? "") + " | " + (banner.duration ?? "")
            }
        }
    }
}
