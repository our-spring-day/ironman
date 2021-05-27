//
//  AdditionalInfoView.swift
//  ironman
//
//  Created by 정재인 on 2021/05/27.
//

import UIKit

class AdditionalInfoView: UIView {
    let penaltyButton = BaseGrayButton(icon: "💩", text: "벌칙 정하기")
    let memoButton = BaseGrayButton(icon: "✏️", text: "메모 남기기")
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: attribute & layout

extension AdditionalInfoView {
    func layout() {
        [penaltyButton, memoButton].forEach { addSubview($0) }
        
        penaltyButton.snp.makeConstraints {
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(64)
            $0.top.equalToSuperview()
        }
        memoButton.snp.makeConstraints {
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(64)
            $0.top.equalTo(penaltyButton.snp.bottom).offset(10)
        }
    }
}
