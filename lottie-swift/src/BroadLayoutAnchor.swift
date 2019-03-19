//
//  BroadLayoutAnchor.swift
//  BroadLayoutAnchor
//
//  Created by ike on 2019/3/19.
//  Copyright © 2019 IkeBan. All rights reserved.
//
import UIKit

@objc public protocol LayoutAnchorable {
    func bd_constraint(equalTo anchor: LayoutAnchorable, constant c: CGFloat) -> NSLayoutConstraint
    
    func bd_constraint(greaterThanOrEqualTo anchor: LayoutAnchorable, constant c: CGFloat) -> NSLayoutConstraint
    
    func bd_constraint(lessThanOrEqualTo anchor: LayoutAnchorable, constant c: CGFloat) -> NSLayoutConstraint
}

public extension LayoutAnchorable {
    func bd_constraint(equalTo anchor: LayoutAnchorable) -> NSLayoutConstraint {
        return self.bd_constraint(equalTo: anchor, constant: 0)
    }
    
    func bd_constraint(greaterThanOrEqualTo anchor: LayoutAnchorable) -> NSLayoutConstraint {
        return self.bd_constraint(greaterThanOrEqualTo: anchor, constant: 0)
    }
    
    func bd_constraint(lessThanOrEqualTo anchor: LayoutAnchorable) -> NSLayoutConstraint {
        return self.bd_constraint(lessThanOrEqualTo: anchor, constant: 0)
    }
}

open class BroadLayoutAnchor: NSObject {
    fileprivate var bd_item: UIView
    
    fileprivate var bd_attribute: NSLayoutConstraint.Attribute
    
    init(item: UIView, attribute: NSLayoutConstraint.Attribute) {
        self.bd_item = item
        self.bd_attribute = attribute
        super.init()
    }
    
    public func constraint(equalTo anchor: BroadLayoutAnchor, constant c: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: bd_item,
                                  attribute: bd_attribute,
                                  relatedBy: .equal,
                                  toItem: anchor.bd_item,
                                  attribute: anchor.bd_attribute,
                                  multiplier: 1,
                                  constant: c)
    }
    
    public func constraint(greaterThanOrEqualTo anchor: BroadLayoutAnchor, constant c: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: bd_item,
                                  attribute: bd_attribute,
                                  relatedBy: .greaterThanOrEqual,
                                  toItem: anchor.bd_item,
                                  attribute: anchor.bd_attribute,
                                  multiplier: 1,
                                  constant: c)
    }
    
    public func constraint(lessThanOrEqualTo anchor: BroadLayoutAnchor, constant c: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: bd_item,
                                  attribute: bd_attribute,
                                  relatedBy: .lessThanOrEqual,
                                  toItem: anchor.bd_item,
                                  attribute: anchor.bd_attribute,
                                  multiplier: 1,
                                  constant: c)
    }
}

@available(iOS 9.0, *)
extension NSLayoutAnchor: LayoutAnchorable {
    public func bd_constraint(equalTo anchor: LayoutAnchorable, constant c: CGFloat) -> NSLayoutConstraint {
        guard let anchor = anchor as? NSLayoutAnchor else { return NSLayoutConstraint() }
        return self.constraint(equalTo: anchor, constant: c)
    }
    
    public func bd_constraint(greaterThanOrEqualTo anchor: LayoutAnchorable, constant c: CGFloat) -> NSLayoutConstraint {
        guard let anchor = anchor as? NSLayoutAnchor else { return NSLayoutConstraint() }
        return self.constraint(greaterThanOrEqualTo: anchor, constant: c)
    }
    
    public func bd_constraint(lessThanOrEqualTo anchor: LayoutAnchorable, constant c: CGFloat) -> NSLayoutConstraint {
        guard let anchor = anchor as? NSLayoutAnchor else { return NSLayoutConstraint() }
        return self.constraint(lessThanOrEqualTo: anchor, constant: c)
    }
}


extension BroadLayoutAnchor: LayoutAnchorable {
    public func bd_constraint(equalTo anchor: LayoutAnchorable, constant c: CGFloat) -> NSLayoutConstraint {
        guard let anchor = anchor as? BroadLayoutAnchor else { return NSLayoutConstraint() }
        return self.constraint(equalTo: anchor, constant: c)
    }
    
    public func bd_constraint(greaterThanOrEqualTo anchor: LayoutAnchorable, constant c: CGFloat) -> NSLayoutConstraint {
        guard let anchor = anchor as? BroadLayoutAnchor else { return NSLayoutConstraint() }
        return self.constraint(greaterThanOrEqualTo: anchor, constant: c)
    }
    
    public func bd_constraint(lessThanOrEqualTo anchor: LayoutAnchorable, constant c: CGFloat) -> NSLayoutConstraint {
        guard let anchor = anchor as? BroadLayoutAnchor else { return NSLayoutConstraint() }
        return self.constraint(lessThanOrEqualTo: anchor, constant: c)
    }
    
}

public extension UIView {
    
    var bd_topAnchor: LayoutAnchorable {
        if #available(iOS 9.0, *) {
            return self.topAnchor
        } else {
            return BroadLayoutAnchor(item: self, attribute: .top)
        }
    }
    
    var bd_leftAnchor: LayoutAnchorable {
        if #available(iOS 9.0, *) {
            return self.leftAnchor
        } else {
            return BroadLayoutAnchor(item: self, attribute: .left)
        }
    }
    
    var bd_rightAnchor: LayoutAnchorable {
        if #available(iOS 9.0, *) {
            return self.rightAnchor
        } else {
            return BroadLayoutAnchor(item: self, attribute: .right)
        }
    }
    
    var bd_bottomAnchor: LayoutAnchorable {
        if #available(iOS 9.0, *) {
            return self.bottomAnchor
        } else {
            return BroadLayoutAnchor(item: self, attribute: .bottom)
        }
    }
    
    var bd_widthAnchor: LayoutAnchorable {
        if #available(iOS 9.0, *) {
            return self.widthAnchor
        } else {
            return BroadLayoutAnchor(item: self, attribute: .width)
        }
    }
    
    var bd_heightAnchor: LayoutAnchorable {
        if #available(iOS 9.0, *) {
            return self.heightAnchor
        } else {
            return BroadLayoutAnchor(item: self, attribute: .height)
        }
    }
    
    var bd_centerXAnchor: LayoutAnchorable {
        if #available(iOS 9.0, *) {
            return self.centerXAnchor
        } else {
            return BroadLayoutAnchor(item: self, attribute: .centerX)
        }
    }
    
    var bd_centerYAnchor: LayoutAnchorable {
        if #available(iOS 9.0, *) {
            return self.centerYAnchor
        } else {
            return BroadLayoutAnchor(item: self, attribute: .centerY)
        }
    }
    
    var bd_leadingAnchor: LayoutAnchorable {
        if #available(iOS 9.0, *) {
            return self.leadingAnchor
        } else {
            return BroadLayoutAnchor(item: self, attribute: .leading)
        }
    }
    
    var bd_trailingAnchor: LayoutAnchorable {
        if #available(iOS 9.0, *) {
            return self.trailingAnchor
        } else {
            return BroadLayoutAnchor(item: self, attribute: .trailing)
        }
    }
    
    var bd_firstBaselineAnchor: LayoutAnchorable {
        if #available(iOS 9.0, *) {
            return self.firstBaselineAnchor
        } else {
            return BroadLayoutAnchor(item: self, attribute: .firstBaseline)
        }
    }
    
    var bd_lastBaselineAnchor: LayoutAnchorable {
        if #available(iOS 9.0, *) {
            return self.lastBaselineAnchor
        } else {
            return BroadLayoutAnchor(item: self, attribute: .lastBaseline)
        }
    }
}
