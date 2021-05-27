//
//  RequiredInfoView.swift
//  ironman
//
//  Created by 정재인 on 2021/05/26.
//

import UIKit

class RequiredInfoView: UIView {
    let timeButton = BaseGrayButton(icon: "🗓", text: "날짜 및 시간")
    let placeButton = BaseGrayButton(icon: "⛳️", text: "장소")
    let memberButton = BaseGrayButton(icon: "👫", text: "참석 인원")
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: attribute & layout

extension RequiredInfoView {
    func layout() {
        [timeButton, placeButton, memberButton].forEach { addSubview($0) }
        
        timeButton.snp.makeConstraints {
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(64)
            $0.top.equalToSuperview()
        }
        placeButton.snp.makeConstraints {
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(64)
            $0.top.equalTo(timeButton.snp.bottom).offset(10)
        }
        memberButton.snp.makeConstraints {
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(64)
            $0.top.equalTo(placeButton.snp.bottom).offset(10)
        }
    }
}
