//
//  CreateConfirmButton.swift
//  ironman
//
//  Created by 정재인 on 2021/05/27.
//

import UIKit

class CreateConfirmButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        self.titleLabel?.textColor = .white
        self.titleLabel?.font = UIFont(name: "NotoSansKR-Bold", size: 14)
        self.backgroundColor = UIColor(red: 0.834, green: 0.834, blue: 0.834, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
