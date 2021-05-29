//
//  ChevronGrayButton.swift
//  ironman
//
//  Created by 정재인 on 2021/05/29.
//

import UIKit

class ChevronGrayButton: BaseGrayButton {
    let chevronImageView = UIImageView()
    
    override init(frame: CGRect? = .zero, icon: String, text: String) {
        super.init(frame: .zero, icon: icon, text: text)
        self.attribute()
        self.layout()
        iconLabel.text = icon
        textLabel.text = text
    }
    
    override func attribute() {
        super.attribute()
        chevronImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.tintColor = .black
            $0.alpha = 0.2
            $0.image = UIImage(systemName: "chevron.forward")?
                .withConfiguration(
                    UIImage.SymbolConfiguration(weight: .semibold))
        }
    }
    
    override func layout() {
        super.layout()
        [chevronImageView].forEach { addSubview($0) }
        
        chevronImageView.snp.makeConstraints {
            $0.centerY.equalTo(snp.centerY)
            $0.trailing.equalTo(snp.trailing).offset(-20.29)
            $0.width.equalTo(5.17)
        }
        textLabel.snp.makeConstraints {
            $0.trailing.equalTo(chevronImageView.snp.leading).offset(-14)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
