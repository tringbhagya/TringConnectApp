//
//  TCColorPalette.swift
//  TringConnect
//
//  Created by Bhagya on 30/04/22.
//

import UIKit

enum TCColorPalette: String, CaseIterable, Codable {
    
    // Greyscale
    case brandingGray
    case disabledLightGray
    case gray
    case green
    case likeTextGray
    case tagTextGray
    case postTextGray
    
    var colorName: String {
        switch self {
            case .brandingGray: return "BrandingGray"
            case .disabledLightGray: return "DisabledLightGray"
            case .gray: return "Gray"
            case .green: return "Green"
            case .likeTextGray: return "LikeTextGray"
            case .tagTextGray: return "TagTextGray"
            case .postTextGray: return "PostTextGray"
        }
    }
    
    var color: UIColor? {
        UIColor(named: colorName)
    }
}
