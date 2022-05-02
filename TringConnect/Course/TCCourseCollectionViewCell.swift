//
//  TCCourseCollectionViewCell.swift
//  TringConnect
//
//  Created by Bhagya on 02/05/22.
//

import Foundation
import UIKit

class TCCourseCollectionViewCell: UICollectionViewCell {
    static let cellId = "TCCourseCollectionViewCell"

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: TCLabel!
    @IBOutlet weak var registerLabel: TCLabel!
    @IBOutlet weak var registerView: UIView!
    
    private var isRegisterSelected = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetUp()
    }
    
    func initialSetUp() {
        registerView.backgroundColor = TCColorPalette.gray.color
        isRegisterSelected = false

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(registerViewTapped(gesture:)))
        tapGesture.numberOfTapsRequired = 1

        registerView.isUserInteractionEnabled = true
        registerView.addGestureRecognizer(tapGesture)
    }
    
    @objc func registerViewTapped(gesture: UIGestureRecognizer) {
        isRegisterSelected = !isRegisterSelected
        registerView.backgroundColor = isRegisterSelected ? TCColorPalette.green.color : TCColorPalette.gray.color
    }
    
    func configureUI(_ courseData: TCCourse) {
        self.imageView.image = UIImage(named: courseData.image ?? "")
        self.titleLabel.text = courseData.title
    }
}
