//
//  TCFeedsViewModel.swift
//  TringConnect
//
//  Created by Bhagya on 01/05/22.
//

import Foundation
import UIKit

class TCFeedsViewModel {
    private var items = [TCFeed]()
    var notificationBarButton: UIBarButtonItem?
    
    func getLeftNavigationItem() -> UIBarButtonItem {
        let hamburgerButton = TCButton()
        hamburgerButton.setImageNames(TCConstant.kHamburgerMenu, selectedIcon: TCConstant.kHamburgerMenuSelected)
       return UIBarButtonItem(customView: hamburgerButton)
    }
    
    func getRightNavigationItems() -> [UIBarButtonItem] {
        let notificationButton = TCButton()
        notificationButton.setImageNames(TCConstant.kNotificationIcon, selectedIcon: TCConstant.kNotificationIconSelected)
        
        let searchButton = TCButton()
        searchButton.setImageNames(TCConstant.kSearchIcon, selectedIcon: TCConstant.kSearchIconSelected)
        
        notificationBarButton = UIBarButtonItem(customView: notificationButton)
        
        return [UIBarButtonItem(customView: searchButton),
                notificationBarButton!]
    }
    
    func getTabBarItems() -> [UITabBarItem] {
        var tabBarItems = [UITabBarItem]()
        
        for defaultIcon in TCConstant.kTabBarDefaultIcons {
            let selectedIcon = defaultIcon + TCConstant.kFilledSuffix
            let tabBarItem = UITabBarItem(title: "",
                                          image: UIImage(named: defaultIcon),
                                          selectedImage: UIImage(named: selectedIcon))
            tabBarItems.append(tabBarItem)
        }
        return tabBarItems
    }
    
    func loadFeedDataValues() {
        let data = TCParserUtility.getDataFromJson("Feeds", TCFeedModel.self)
        switch data {
        case .success(let resultData):
            sortAndSaveItems(resultData.items ?? [])
            print(resultData)
        case .failure(let error):
            print(error)
        }
    }
    
    private func sortAndSaveItems(_ resultData: [TCFeed]) {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        df.locale = Locale(identifier: "en_US_POSIX")
        df.timeZone = TimeZone(identifier: "UTC")!
        
        let sortedArray = resultData.sorted {df.date(from: $0.date ?? "")! > df.date(from: $1.date ?? "")!}
        self.items = sortedArray
    }
    
    func getFeedDataItems() -> [TCFeed] {
        return items
    }
}

