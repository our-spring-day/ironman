//
//  BaseGrayButton.swift
//  ironman
//
//  Created by 정재인 on 2021/05/26.
//

import UIKit

class BaseGrayButton: UIButton {
    let iconLabel = UILabel()
    let textLabel = UILabel()
    
    init(frame: CGRect? = .zero, icon: String, text: String) {
        super.init(frame: .zero)
        attribute()
        layout()
        iconLabel.text = icon
        textLabel.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func attribute() {
        self.do {
            $0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.03)
            $0.layer.cornerRadius = 14
            $0.layer.masksToBounds = true
        }
        iconLabel.do {
            $0.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        }
        textLabel.do {
            $0.textColor = .black
            $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        }
        
    }
    
    func layout() {
        [iconLabel, textLabel].forEach {
            addSubview($0)
        }
        
        iconLabel.snp.makeConstraints {
            $0.centerY.equalTo(snp.centerY)
            $0.leading.equalTo(snp.leading).offset(16)
            $0.width.equalTo(24)
        }
        textLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(19)
            $0.bottom.equalToSuperview().offset(-19)
            $0.leading.equalTo(iconLabel.snp.trailing).offset(14)
        }
    }
}

