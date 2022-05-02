//
//  TCFeedsTableViewCellViewModel.swift
//  TringConnect
//
//  Created by Bhagya on 01/05/22.
//

import Foundation

class TCFeedsTableViewCellViewModel {
    let kNameLabelType = TCLabelType(textType: .feedTitle, textColor: .gray, bgColor: nil, numberOfLines: 1)
    let kRoleLabelType = TCLabelType(textType: .feedDesignationText, textColor: .gray, bgColor: nil, numberOfLines: 1)
    let kPostLabelType = TCLabelType(textType: .feedDescriptionText, textColor: .postTextGray, bgColor: nil, numberOfLines: 3)
    let kTagLabelType = TCLabelType(textType: .feedTagText, textColor: .tagTextGray, bgColor: nil, numberOfLines: 1)
    let kReadMoreLabelType = TCLabelType(textType: .readMoreText, textColor: .green, bgColor: nil, numberOfLines: 1)

    var feedData: TCFeed?
    
    func getTagsText(_ items: [String]?) -> String {
        guard let tagItems = items, !tagItems.isEmpty else { return "" }
        
        var tagText = ""
        for tagItem in tagItems {
            tagText += "#" + tagItem + " "
        }
        return tagText
    }
}
