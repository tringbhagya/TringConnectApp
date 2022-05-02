//
//  TCLikeCommentSectionViewModel.swift
//  TringConnect
//
//  Created by Bhagya on 30/04/22.
//

import Foundation
import UIKit

class TCLikeCommentSectionViewModel {
    let kAddCommentHeight = 48.0
    let kAddCommentBottomSpace = 24.0
        
    func getLikedByText(_ totalLikes: Int) -> NSAttributedString {
        let likedByText = NSMutableAttributedString(string: "Liked by ", attributes: [NSAttributedString.Key.font: UIFont.getCustomFont(.numberOfLikes)])
        let attrString2 = NSAttributedString(string: "KnE ", attributes: [NSAttributedString.Key.font: UIFont.getCustomFont(.likedByText)])
        let attrString3 = NSAttributedString(string: "and ", attributes: [NSAttributedString.Key.font: UIFont.getCustomFont(.numberOfLikes)])
        
        let othersString = String(totalLikes-1) + " others"
        let attrString4 = NSAttributedString(string: othersString, attributes: [NSAttributedString.Key.font: UIFont.getCustomFont(.likedByText)])

        likedByText.append(attrString2)
        likedByText.append(attrString3)
        likedByText.append(attrString4)
        
        return likedByText
    }
    
    func getPostedTimeAgo(_ date: String?, time: String?) -> String {
        guard let dateString = date, !dateString.isEmpty else { return "" }

        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        df.locale = Locale(identifier: "en_US_POSIX")
        df.timeZone = TimeZone(identifier: "UTC")!

        let dateTimeString = dateString + " " + (time ?? "")
        let date = df.date(from: dateTimeString)
        if date != nil {
            return date!.timeAgoSinceDate()
        }  else { return "" }
    }
}
