//
//  TALabel.swift
//  TringConnect
//
//  Created by Bhagya on 30/04/22.
//

import Foundation
import UIKit

struct TCLabelType: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case textType
        case textColor
        case bgColor
        case numberOfLines
    }
    
    let textType: TCTextStyle?
    let textColor: TCColorPalette?
    let bgColor: TCColorPalette?
    let numberOfLines: Int?
}

class TCLabel: UILabel {
    
    // MARK: Initializers
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(_ frame: CGRect, style: TCLabelType) {
        self.init(frame: frame)
        labelType = style
    }

    var labelType: TCLabelType? {
        didSet {
            guard let labelStyle = labelType else { return }
            
            self.textColor = labelStyle.textColor?.color ?? UIColor.gray
            self.font = UIFont.getCustomFont(labelStyle.textType ?? TCTextStyle.none)
            self.backgroundColor = labelStyle.bgColor?.color ?? UIColor.white
            self.numberOfLines = labelStyle.numberOfLines ?? 1
        }
    }
    
    // MARK: Dealloc
    deinit {
       debugPrint("Deinit - TCLabel")
    }
}


