//
//  CreateDetailConfirmButton.swift
//  ironman
//
//  Created by 정재인 on 2021/05/28.
//

import UIKit

class CreateDetailConfirmButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.354, green: 0.421, blue: 1, alpha: 1)
        self.layer.cornerRadius = 22
        self.layer.masksToBounds = true
        self.titleLabel?.font = UIFont(name: "NotoSansKR-Bold", size: 14)
        self.setTitle("확인", for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
