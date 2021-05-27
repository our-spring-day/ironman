//
//  TitleLabel.swift
//  ironman
//
//  Created by 정재인 on 2021/05/26.
//

import UIKit

class TitleLabel: UILabel {
    
    init(text: String) {
        super.init(frame: .zero)
        self.do {
            $0.text = text
            $0.textColor = .black
            $0.font = UIFont(name: "NotoSansKR-Medium", size: 24.09)
            $0.font = self.font.withSize(24.09)
            $0.attributedText =
                NSMutableAttributedString(string: text,
                                          attributes: [NSAttributedString.Key.kern: -1.25])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
