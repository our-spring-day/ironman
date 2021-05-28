//
//  UITextField+Ext.swift
//  ironman
//
//  Created by 정재인 on 2021/05/28.
//

import UIKit

extension UITextField {
    func addLeftPadding(padding: CGFloat = 10) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
