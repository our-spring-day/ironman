//
//  PenaltyTargetInfoView.swift
//  ironman
//
//  Created by 정재인 on 2021/05/28.
//

import UIKit

struct tempPenalty {
    let icon: String
    let text: String
}

class PenaltyTargetInfoView: UIView {
    let boobyButton = BaseGrayButton(icon: "👤", text: "꼴찌")
    let latecomerButton = BaseGrayButton(icon: "👥", text: "지각한 사람 모두")
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PenaltyTargetInfoView {
    func attribute() {}
    func layout() {
        [boobyButton, latecomerButton].forEach { addSubview($0) }
        
        boobyButton.snp.makeConstraints {
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(64)
            $0.top.equalToSuperview()
        }
        latecomerButton.snp.makeConstraints {
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(64)
            $0.top.equalTo(boobyButton.snp.bottom).offset(10)
        }
    }
}
