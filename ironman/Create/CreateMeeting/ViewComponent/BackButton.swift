//
//  BackButton.swift
//  ironman
//
//  Created by 정재인 on 2021/05/28.
//

import UIKit

class BackButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.tintColor = .black
        self.setImage(UIImage(systemName: "arrow.backward")?
                        .withConfiguration(
                            UIImage.SymbolConfiguration(weight: .semibold)),
                    for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
