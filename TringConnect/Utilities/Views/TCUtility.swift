//
//  TCViewUtility.swift
//  TringConnect
//
//  Created by Bhagya on 30/04/22.
//

import UIKit

extension UIView {
    
    func commonInit(_ nibName: String) {
        guard let view = loadViewFromNib(nibName) else {
            return
        }
        view.addAsSubViewWithEqualConstraintTo(self)
    }
    
    func loadViewFromNib(_ nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)

        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func addAsSubViewWithEqualConstraintTo(_ containerView: UIView) {
        self.frame = containerView.bounds
        containerView.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0.0),
            self.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0.0),
            self.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0.0),
            self.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0.0)
            ])
    }
    
    func addBorder(color: UIColor, width: CGFloat) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}


extension Date {
    func timeAgoSinceDate() -> String {
        // From Time
        let fromDate = self
        // To Time
        let toDate = Date()

        // Estimation
        // Year
        if let interval = Calendar.current.dateComponents([.year], from: fromDate, to: toDate).year, interval > 0  {
            return interval == 1 ? "\(interval)" + " " + "year ago" : "\(interval)" + " " + "years ago"
        }

        // Month
        if let interval = Calendar.current.dateComponents([.month], from: fromDate, to: toDate).month, interval > 0  {
            return interval == 1 ? "\(interval)" + " " + "month ago" : "\(interval)" + " " + "months ago"
        }

        // Day
        if let interval = Calendar.current.dateComponents([.day], from: fromDate, to: toDate).day, interval > 0  {
            return interval == 1 ? "\(interval)" + " " + "day ago" : "\(interval)" + " " + "days ago"
        }

        // Hours
        if let interval = Calendar.current.dateComponents([.hour], from: fromDate, to: toDate).hour, interval > 0 {
            return interval == 1 ? "\(interval)" + " " + "hour ago" : "\(interval)" + " " + "hours ago"
        }

        // Minute
        if let interval = Calendar.current.dateComponents([.minute], from: fromDate, to: toDate).minute, interval > 0 {
            return interval == 1 ? "\(interval)" + " " + "minute ago" : "\(interval)" + " " + "minutes ago"
        }

        return "a moment ago"
    }
}
