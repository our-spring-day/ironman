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
    let chevronImageView = UIImageView()
    
    init(frame: CGRect = .zero, icon: String, text: String) {
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
            $0.backgroundColor = .systemGray6
//            $0.alpha = 0.03
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
        chevronImageView.do {
            $0.tintColor = .black
            $0.alpha = 0.2
            $0.image = UIImage(systemName: "chevron.forward")?
                .withConfiguration(
                    UIImage.SymbolConfiguration(weight: .semibold))
        }
    }
    
    func layout() {
        [iconLabel, textLabel, chevronImageView].forEach {
            addSubview($0)
        }
        
        iconLabel.snp.makeConstraints {
            $0.centerY.equalTo(snp.centerY)
            $0.leading.equalTo(snp.leading).offset(16)
        }
        textLabel.snp.makeConstraints {
            $0.centerY.equalTo(snp.centerY)
            $0.leading.equalTo(iconLabel.snp.trailing).offset(14)
        }
        chevronImageView.snp.makeConstraints {
            $0.centerY.equalTo(snp.centerY)
            $0.trailing.equalTo(snp.trailing).offset(-20.29)
        }
    }
}

