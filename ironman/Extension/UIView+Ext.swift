//
//  UIView+Ext.swift
//  ironman
//
//  Created by 정재인 on 2021/06/16.
//

import UIKit

extension UIView {
    func setRadiusWithMasksToBounds(_ value: CGFloat) {
        self.layer.cornerRadius = value
        self.layer.masksToBounds = true
    }
}
