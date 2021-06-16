//
//  MeetingTitleLabel.swift
//  ironman
//
//  Created by 정재인 on 2021/06/16.
//

import UIKit

class MeetingTitleLabel: UILabel {
    init(text: String) {
        super.init(frame: .zero)
        self.do {
            $0.text = text
            $0.textColor = .black
            $0.font = UIFont(name: "NotoSansKR-Medium", size: 16)
            $0.attributedText = NSMutableAttributedString(string: "안산시 상록구 · 1시  · 오늘",
                                                          attributes: [NSAttributedString.Key.kern: -0.2])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
