//
//  TCButton.swift
//  TringConnect
//
//  Created by Bhagya on 30/04/22.
//

import Foundation
import UIKit

class TCButton: UIButton {
    var defaultImage: String?
    var selectedImage: String?
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    convenience init(_ frame: CGRect, style: TCLabelType) {
        self.init(frame: frame)
        labelType = style
    }
    
    var labelType: TCLabelType? {
        didSet {
            guard let labelStyle = labelType else { return }
            
            self.setTitleColor(labelStyle.textColor?.color ?? UIColor.gray, for: .normal)
            self.titleLabel?.font = UIFont.getCustomFont(labelStyle.textType ?? TCTextStyle.none)
            self.backgroundColor = labelStyle.bgColor?.color ?? UIColor.white
            self.titleLabel?.numberOfLines = labelStyle.numberOfLines ?? 1
        }
    }
    
    func setImageNames(_ defaultIcon: String, selectedIcon: String) {
        self.defaultImage = defaultIcon
        self.selectedImage = selectedIcon
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.isSelected = false
    }
    
    @objc func buttonTapped() {
        self.isSelected = !self.isSelected
    }
    
    override var isSelected: Bool {
        didSet {
            let imageName = (isSelected ? selectedImage : defaultImage) ?? ""
            self.setImage(UIImage(named: imageName), for: .normal)
        }
    }
    
    // MARK: Dealloc
    deinit {
       debugPrint("Deinit - TCButton")
    }
}
