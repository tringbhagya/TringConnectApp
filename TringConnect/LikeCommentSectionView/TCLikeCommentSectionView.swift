//
//  LikeCommentSectionView.swift
//  TringConnect
//
//  Created by Bhagya on 30/04/22.
//

import UIKit

class TCLikeCommentSectionView: UIView {
    let kNibName = "TCLikeCommentSectionView"
    
    @IBOutlet weak var addCommentHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var addCommentBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var addCommentGroupView: UIView!
    
    @IBOutlet weak var postedTimeLabel: TCLabel!
    @IBOutlet weak var totalLikesLabel: TCLabel!
    @IBOutlet weak var totalCommentsLabel: TCLabel!
    @IBOutlet weak var likedByLabel: TCLabel!

    @IBOutlet weak var likesButton: TCButton!
    @IBOutlet weak var addCommentField: UITextField!
      
    private let viewModel = TCLikeCommentSectionViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit(kNibName)
        initialSetUp()
    }
    
    private func initialSetUp() {
        likesButton.setImageNames(TCConstant.kLikeIcon, selectedIcon: TCConstant.kLikeIconFilled)
        self.totalComments = 0
        configureAddCommentView()
        self.addCommentField.delegate = self
        addObservers()
    }
    
    private func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name:UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name:UIResponder.keyboardWillHideNotification, object: nil);

    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
//        if self.addCommentField.isFirstResponder {
//            self.frame.origin.y -= 300
//         }
    }

    @objc func keyboardWillHide(notification: NSNotification){
//        if self.addCommentField.isFirstResponder {
//           self.frame.origin.y += 300
//        }
    }
    
    private func configureAddCommentView(shouldShowView: Bool = false) {
        addCommentHeightConstraint.constant = shouldShowView ? viewModel.kAddCommentHeight : 0.0
        addCommentBottomConstraint.constant = shouldShowView ? viewModel.kAddCommentBottomSpace : 0.0
        addCommentGroupView.layoutSubviews()
        addCommentGroupView.isHidden = !shouldShowView
    }
    
    func configureUI(_ feedData: TCFeed) {
        self.postedTimeLabel.text = viewModel.getPostedTimeAgo(feedData.date,
                                                               time: feedData.time ?? "")
        self.totalLikesLabel.text = String(feedData.likes ?? 10)
        
        if self.totalComments == 0 {
            self.totalComments = feedData.comments ?? 0
        }
        
        self.likedByLabel.attributedText = viewModel.getLikedByText(feedData.likes ?? 10)
    }
    
    @IBAction func commentButtonTapped(_ sender: UIButton) {
        configureAddCommentView(shouldShowView: true)
        addCommentField.becomeFirstResponder()
        
    }
    
    @IBAction func sendCommentTapped(_ sender: UIButton) {
        self.addCommentField.resignFirstResponder()
        if self.addCommentField.text?.isEmpty == false {
            self.totalComments += 1
        }
    }
    
    var totalComments: Int = 0 {
        didSet {
            self.totalCommentsLabel.text = String(totalComments)
        }
    }
    
}


extension TCLikeCommentSectionView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
