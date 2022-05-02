//
//  File.swift
//  TringConnect
//
//  Created by Bhagya on 30/04/22.
//

import UIKit

enum TCTextStyle: String, CaseIterable, Codable {
    case userStoryName
    case feedTitle
    case feedDesignationText
    case feedDescriptionText
    case feedTagText
    case readMoreText
    case postedTimeText
    case likedByText
    case numberOfLikes
    case commentText
    case bannerDescription
    case bannerSiteText
    case knowMoreText
    case courseTitle
    case courseName
    case none
}

enum TCFontStyle: String {
    case poppinsSemiBold = "Poppins-SemiBold"
    case poppinsRegular = "Poppins-Regular"
    case poppinsMedium = "Poppins-Medium"
    case poppinsLight = "Poppins-Light"
}


extension UIFont {
    static func getCustomFont(_ textStyle: TCTextStyle) -> UIFont {
        
        switch textStyle {
        case .userStoryName, .bannerSiteText:
            return UIFont(name: getFontName(.poppinsRegular), size: 9.0) ?? getDefaultFont(9.0)
        case .feedTitle:
            return UIFont(name: getFontName(.poppinsSemiBold), size: 18.0) ?? getDefaultFont(18.0)
        case .feedDesignationText, .postedTimeText:
            return UIFont(name: getFontName(.poppinsLight), size: 12.0) ?? getDefaultFont(12.0)
        case .feedDescriptionText:
            return UIFont(name: getFontName(.poppinsRegular), size: 16.0) ?? getDefaultFont(16.0)
        case .feedTagText:
            return UIFont(name: getFontName(.poppinsRegular), size: 10.0) ?? getDefaultFont(10.0)
        case .readMoreText:
            return UIFont(name: getFontName(.poppinsMedium), size: 10.0) ?? getDefaultFont(10.0)
        case .likedByText:
            return UIFont(name: getFontName(.poppinsSemiBold), size: 12.0) ?? getDefaultFont(12.0)
        case .numberOfLikes, .courseName:
            return UIFont(name: getFontName(.poppinsRegular), size: 12.0) ?? getDefaultFont(12.0)
        case .commentText, .bannerDescription:
            return UIFont(name: getFontName(.poppinsRegular), size: 14.0) ?? getDefaultFont(14.0)
        case .knowMoreText:
            return UIFont(name: getFontName(.poppinsMedium), size: 14.0) ?? getDefaultFont(14.0)
        case .courseTitle:
            return UIFont(name: getFontName(.poppinsMedium), size: 20.0) ?? getDefaultFont(20.0)
        case .none:
            return UIFont(name: getFontName(.poppinsRegular), size: 11.0) ?? getDefaultFont(11.0)
        }
    }
    
    static func getDefaultFont(_ size: CGFloat = 10.0) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }
    
    static func getFontName(_ fontType: TCFontStyle) -> String {
        switch fontType {
            case .poppinsSemiBold: return TCFontStyle.poppinsSemiBold.rawValue
            case .poppinsRegular: return TCFontStyle.poppinsRegular.rawValue
            case .poppinsMedium: return TCFontStyle.poppinsMedium.rawValue
            case .poppinsLight: return TCFontStyle.poppinsLight.rawValue
        }
    }
}
