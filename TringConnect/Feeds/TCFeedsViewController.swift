//
//  ViewController.swift
//  TringConnect
//
//  Created by Bhagya on 30/04/22.
//

import UIKit

protocol TCMediaViewDelegate: NSObjectProtocol {
    func displayMediaGalleryView(_ images: [String], selectedIndex: Int)
}

class TCFeedsViewController: UIViewController {
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var tableView: UITableView!
    fileprivate var indicatorImage: UIImageView?
    
    private let viewModel = TCFeedsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTabBar()
        viewModel.loadFeedDataValues()
        setupDataSource()
    }

    private func setupNavigationBar() {
        let titleImageView = UIImageView(image: UIImage(named: TCConstant.klogoName))
        self.navigationItem.titleView = titleImageView
        
        self.navigationItem.leftBarButtonItem = viewModel.getLeftNavigationItem()
        self.navigationItem.rightBarButtonItems = viewModel.getRightNavigationItems()
    }
    
    private func setupTabBar() {
        self.tabBar.items = viewModel.getTabBarItems()
        self.tabBar.selectedItem = self.tabBar.items?.first
        
        let numberOfItems = CGFloat(tabBar.items!.count)
        let tabBarItemSize = CGSize(width: (tabBar.frame.width / numberOfItems) - 25, height: tabBar.frame.height)
        
        tabBar.selectionIndicatorImage = createSelectionIndicator(color: UIColor.white, size: tabBarItemSize, lineHeight: 2)
    }
    
    func createSelectionIndicator(color: UIColor, size: CGSize, lineHeight: CGFloat) -> UIImage {
        let rect: CGRect = CGRect(x: 0, y: size.height - lineHeight - 10.0, width: size.width, height: lineHeight )
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    private func setupDataSource() {
        let storyTableViewCellNib = UINib(nibName: TCStoryTableViewCell.cellId, bundle: nil)
        self.tableView.register(storyTableViewCellNib, forCellReuseIdentifier: TCStoryTableViewCell.cellId)
        
        let feedsTableViewCellNib = UINib(nibName: TCFeedsTableViewCell.cellId, bundle: nil)
        self.tableView.register(feedsTableViewCellNib, forCellReuseIdentifier: TCFeedsTableViewCell.cellId)
        
        let courseTableViewCellNib = UINib(nibName: TCCourseTableViewCell.cellId, bundle: nil)
        self.tableView.register(courseTableViewCellNib, forCellReuseIdentifier: TCCourseTableViewCell.cellId)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

extension TCFeedsViewController: TCMediaViewDelegate {
    func displayMediaGalleryView(_ images: [String], selectedIndex: Int) {
        self.performSegue(withIdentifier: "showMedia", sender: ["imageList": images,
                                                                "selectedIndex": selectedIndex])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? TCMediaViewController,
            let senderDict = sender as? [String: Any] {
            viewController.imageList = senderDict["imageList"] as? [String] ?? []
            viewController.imageIndex = senderDict["selectedIndex"] as? Int ?? 0
        }
    }
}

extension TCFeedsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getFeedDataItems().count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TCStoryTableViewCell.cellId, for: indexPath) as? TCStoryTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            let feedData = viewModel.getFeedDataItems()[indexPath.row-1]
            if feedData.type != "course" {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: TCFeedsTableViewCell.cellId, for: indexPath) as? TCFeedsTableViewCell else {
                    return UITableViewCell()
                }
                cell.configureUI(feedData)
                cell.delegate = self
                cell.layoutIfNeeded()
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: TCCourseTableViewCell.cellId, for: indexPath) as? TCCourseTableViewCell else {
                    return UITableViewCell()
                }
                cell.configureUI(feedData)
                return cell
            }
        }
    }
    
}


extension TCFeedsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
