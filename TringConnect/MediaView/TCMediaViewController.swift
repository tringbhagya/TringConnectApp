//
//  TCMediaViewController.swift
//  TringConnect
//
//  Created by Bhagya on 02/05/22.
//

import Foundation
import UIKit

class TCMediaViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    var imageList: [String] = [String]()
    var imageIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swiped(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swiped(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)

        imageView.image = UIImage(named: imageList.first ?? "")

    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func swiped(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {

            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right :
                self.imageIndex -= 1
                if self.imageIndex <= 0 {
                    self.imageIndex = imageList.count
                }
                if self.imageIndex >= imageList.count {
                    self.imageIndex = imageList.count - 1
                }
                
                UIView.animate(withDuration: 0.1) { [weak self] in
                    guard let strongSelf = self else { return }
                    strongSelf.imageView.image = UIImage(named: strongSelf.imageList[strongSelf.imageIndex])
                }

            case UISwipeGestureRecognizer.Direction.left:
                self.imageIndex += 1
                if self.imageIndex >= imageList.count {
                    self.imageIndex = 0
                }
                UIView.animate(withDuration: 0.1) { [weak self] in
                    guard let strongSelf = self else { return }
                    strongSelf.imageView.image = UIImage(named: strongSelf.imageList[strongSelf.imageIndex])
                }
            default:
                break
            }
        }
    }

}
