//
//  XmarkButton.swift
//  ironman
//
//  Created by 정재인 on 2021/05/26.
//

import UIKit

class XmarkButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.do {
            $0.setImage(UIImage(systemName: "xmark"), for: .normal)
            $0.tintColor = .black
            $0.alpha = 0.2
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
