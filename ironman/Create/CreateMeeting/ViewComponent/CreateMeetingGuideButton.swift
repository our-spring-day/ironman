//
//  CreateMeetingGuideButton.swift
//  ironman
//
//  Created by 정재인 on 2021/05/28.
//

import UIKit

class CreateMeetingGuideButton: UIButton {
    
    init(frame: CGRect? = .zero, text: String) {
        super.init(frame: .zero)
        self.isUserInteractionEnabled = false
        self.setTitle(text, for: .normal)
        self.layer.cornerRadius = 6
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor(red: 0.929, green: 0.929, blue: 1, alpha: 1)
        self.titleLabel?.font = UIFont(name: "NotoSansKR-Medium", size: 15)
        self.setTitleColor(UIColor(red: 0.354, green: 0.421, blue: 1, alpha: 1),
                         for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
